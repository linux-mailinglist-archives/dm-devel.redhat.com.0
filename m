Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D5542781
	for <lists+dm-devel@lfdr.de>; Wed, 12 Jun 2019 15:29:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0A0C030B46F1;
	Wed, 12 Jun 2019 13:28:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7668F46E63;
	Wed, 12 Jun 2019 13:28:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9FD881843501;
	Wed, 12 Jun 2019 13:27:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5CAorg9018862 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jun 2019 06:50:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D1F8078382; Wed, 12 Jun 2019 10:50:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E4877837A;
	Wed, 12 Jun 2019 10:50:37 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BDF7E1806B16;
	Wed, 12 Jun 2019 10:50:34 +0000 (UTC)
Date: Wed, 12 Jun 2019 06:50:34 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Message-ID: <977172256.34591602.1560336634257.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190612083711.2c0cfd7e.cohuck@redhat.com>
References: <20190611163802.25352-1-pagupta@redhat.com>
	<20190611163802.25352-3-pagupta@redhat.com>
	<20190611190209.0b25033e.cohuck@redhat.com>
	<1003601865.34513553.1560310490030.JavaMail.zimbra@redhat.com>
	<20190612083711.2c0cfd7e.cohuck@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.116.228, 10.4.195.25]
Thread-Topic: virtio-pmem: Add virtio pmem driver
Thread-Index: JA2T0z0G1tIHKmlJmlUYn7dmJ8rB0Q==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 12 Jun 2019 09:24:17 -0400
Cc: jack@suse.cz, kvm@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
	david@fromorbit.com, qemu-devel@nongnu.org,
	virtualization@lists.linux-foundation.org, dm-devel@redhat.com,
	adilger kernel <adilger.kernel@dilger.ca>, zwisler@kernel.org,
	aarcange@redhat.com, dave jiang <dave.jiang@intel.com>,
	jstaron@google.com, linux-nvdimm@lists.01.org,
	vishal l verma <vishal.l.verma@intel.com>, david@redhat.com,
	willy@infradead.org, hch@infradead.org,
	linux-acpi@vger.kernel.org, jmoyer@redhat.com,
	linux-ext4@vger.kernel.org, lenb@kernel.org, kilobyte@angband.pl,
	riel@surriel.com, yuval shaia <yuval.shaia@oracle.com>,
	stefanha@redhat.com, imammedo@redhat.com,
	dan j williams <dan.j.williams@intel.com>,
	lcapitulino@redhat.com, kwolf@redhat.com, nilal@redhat.com,
	tytso@mit.edu, xiaoguangrong eric <xiaoguangrong.eric@gmail.com>,
	snitzer@redhat.com, rdunlap@infradead.org, rjw@rjwysocki.net,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, pbonzini@redhat.com,
	darrick wong <darrick.wong@oracle.com>
Subject: Re: [dm-devel] [Qemu-devel] [PATCH v12 2/7] virtio-pmem: Add virtio
 pmem driver
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Wed, 12 Jun 2019 13:29:13 +0000 (UTC)


> 
> Hi Pankaj,
> 
> On Tue, 11 Jun 2019 23:34:50 -0400 (EDT)
> Pankaj Gupta <pagupta@redhat.com> wrote:
> 
> > Hi Cornelia,
> > 
> > > On Tue, 11 Jun 2019 22:07:57 +0530
> > > Pankaj Gupta <pagupta@redhat.com> wrote:
> 
> 
> > > > +	err1 = virtqueue_kick(vpmem->req_vq);
> > > > +	spin_unlock_irqrestore(&vpmem->pmem_lock, flags);
> > > > +	/*
> > > > +	 * virtqueue_add_sgs failed with error different than -ENOSPC, we
> > > > can't
> > > > +	 * do anything about that.
> > > > +	 */
> > > 
> > > Does it make sense to kick if you couldn't add at all?
> > 
> > When we could not add because of -ENOSPC we are waiting and when buffer is
> > added
> > then only we do a kick. For any other error which might be a rare
> > occurrence, I think
> > kick is harmless here and keeps the code clean?
> 
> Yes, I agree it does not hurt. Let's keep it as-is.

Sure.

> 
> 
> > Sure, Thank you. Attaching below on top changes on current patch2 based on
> > your suggestions. Let me know if these are okay and then will send official
> > v13 to for upstream merging.
> 
> Looks good to me, except for one change.

Sure. Will send v13 shortly.

> 
> [Again sorry for the late review, did not want to get the version
> numbers up :)]

Thank you :)

> 
> > 
> > Thanks,
> > Pankaj
> > 
> > ===============
> > 
> > diff --git a/drivers/nvdimm/nd_virtio.c b/drivers/nvdimm/nd_virtio.c
> > index efc535723517..5b8d2367da0b 100644
> > --- a/drivers/nvdimm/nd_virtio.c
> > +++ b/drivers/nvdimm/nd_virtio.c
> > @@ -10,7 +10,7 @@
> >  #include "nd.h"
> >  
> >   /* The interrupt handler */
> > -void host_ack(struct virtqueue *vq)
> > +void virtio_pmem_host_ack(struct virtqueue *vq)
> >  {
> >         struct virtio_pmem *vpmem = vq->vdev->priv;
> >         struct virtio_pmem_request *req_data, *req_buf;
> > @@ -32,10 +32,10 @@ void host_ack(struct virtqueue *vq)
> >         }
> >         spin_unlock_irqrestore(&vpmem->pmem_lock, flags);
> >  }
> > -EXPORT_SYMBOL_GPL(host_ack);
> > +EXPORT_SYMBOL_GPL(virtio_pmem_host_ack);
> >  
> >   /* The request submission function */
> > -int virtio_pmem_flush(struct nd_region *nd_region)
> > +static int virtio_pmem_flush(struct nd_region *nd_region)
> >  {
> >         struct virtio_device *vdev = nd_region->provider_data;
> >         struct virtio_pmem *vpmem  = vdev->priv;
> > @@ -69,7 +69,7 @@ int virtio_pmem_flush(struct nd_region *nd_region)
> >         while ((err = virtqueue_add_sgs(vpmem->req_vq, sgs, 1, 1, req_data,
> >                                         GFP_ATOMIC)) == -ENOSPC) {
> >  
> > -               dev_err(&vdev->dev, "failed to send command to virtio pmem
> > device, no free slots in the virtqueue\n");
> > +               dev_info(&vdev->dev, "failed to send command to virtio pmem
> > device, no free slots in the virtqueue\n");
> >                 req_data->wq_buf_avail = false;
> >                 list_add_tail(&req_data->list, &vpmem->req_list);
> >                 spin_unlock_irqrestore(&vpmem->pmem_lock, flags);
> > @@ -90,7 +90,8 @@ int virtio_pmem_flush(struct nd_region *nd_region)
> >         } else {
> >                 /* A host repsonse results in "host_ack" getting called */
> >                 wait_event(req_data->host_acked, req_data->done);
> > -               err = virtio32_to_cpu(vdev, req_data->resp.ret);
> > +               if ((err = virtio32_to_cpu(vdev, req_data->resp.ret)))
> > +                       err = -EIO;
> 
> Hm, why are you making this change? I think the previous code was fine.

Yes, Something came to my mind while making the change but I agree will keep
this as it was before.

> 
> >         }
> >  
> >         kfree(req_data);
> > @@ -100,7 +101,8 @@ int virtio_pmem_flush(struct nd_region *nd_region)
> >  /* The asynchronous flush callback function */
> >  int async_pmem_flush(struct nd_region *nd_region, struct bio *bio)
> >  {
> > -       /* Create child bio for asynchronous flush and chain with
> > +       /*
> > +        * Create child bio for asynchronous flush and chain with
> >          * parent bio. Otherwise directly call nd_region flush.
> >          */
> >         if (bio && bio->bi_iter.bi_sector != -1) {
> > diff --git a/drivers/nvdimm/virtio_pmem.c b/drivers/nvdimm/virtio_pmem.c
> > index b60ebd8cd2fd..5e3d07b47e0c 100644
> > --- a/drivers/nvdimm/virtio_pmem.c
> > +++ b/drivers/nvdimm/virtio_pmem.c
> > @@ -19,7 +19,7 @@ static int init_vq(struct virtio_pmem *vpmem)
> >  {
> >         /* single vq */
> >         vpmem->req_vq = virtio_find_single_vq(vpmem->vdev,
> > -                                               host_ack, "flush_queue");
> > +                                       virtio_pmem_host_ack,
> > "flush_queue");
> >         if (IS_ERR(vpmem->req_vq))
> >                 return PTR_ERR(vpmem->req_vq);
> >  
> > diff --git a/drivers/nvdimm/virtio_pmem.h b/drivers/nvdimm/virtio_pmem.h
> > index 6e47521be158..998efbc7660c 100644
> > --- a/drivers/nvdimm/virtio_pmem.h
> > +++ b/drivers/nvdimm/virtio_pmem.h
> > @@ -50,6 +50,6 @@ struct virtio_pmem {
> >         uint64_t size;
> >  };
> >  
> > -void host_ack(struct virtqueue *vq);
> > +void virtio_pmem_host_ack(struct virtqueue *vq);
> >  int async_pmem_flush(struct nd_region *nd_region, struct bio *bio);
> >  #endif
> 
> 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
