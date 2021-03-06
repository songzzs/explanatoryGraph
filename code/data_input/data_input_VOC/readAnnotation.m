function objset=readAnnotation(Name_batch,theConf)
MaxObjNum=5000;

minArea=50^2;

objset(MaxObjNum).folder=[];
objset(MaxObjNum).filename=[];
objset(MaxObjNum).name=[];
objset(MaxObjNum).bndbox=[];
objset(MaxObjNum).ID=[];
annotationfile=[theConf.data.readCode,'truth_',Name_batch];
load(annotationfile,'truth');
j=0;
for i=1:length(truth)
    bndbox.xmin=int2str(truth(i).obj.bndbox.Wmin);
    bndbox.xmax=int2str(truth(i).obj.bndbox.Wmax);
    bndbox.ymin=int2str(truth(i).obj.bndbox.Hmin);
    bndbox.ymax=int2str(truth(i).obj.bndbox.Hmax);
    if(~IsAreaValid(bndbox,minArea))
        continue;
    end
    j=j+1;
    objset(j).folder=truth(i).obj.folder;
    objset(j).filename=truth(i).obj.filename;
    objset(j).name=truth(i).obj.name;
    objset(j).bndbox=bndbox;
    objset(j).ID=j;
    if(j>MaxObjNum)
        error('MaxObjNum is too small.');
    end
end
objset=objset(1:j);
