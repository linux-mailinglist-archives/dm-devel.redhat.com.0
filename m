Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id BB10A3F9EDF
	for <lists+dm-devel@lfdr.de>; Fri, 27 Aug 2021 20:34:25 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-q09MTsVZOWOmP_fjjHkmfA-1; Fri, 27 Aug 2021 14:34:08 -0400
X-MC-Unique: q09MTsVZOWOmP_fjjHkmfA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 069EB6409B;
	Fri, 27 Aug 2021 18:34:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8475E100AE35;
	Fri, 27 Aug 2021 18:34:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C18CC181A0F1;
	Fri, 27 Aug 2021 18:34:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17RIXv9J015024 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 27 Aug 2021 14:33:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 797241A91E6; Fri, 27 Aug 2021 18:33:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72D9E1A91E3
	for <dm-devel@redhat.com>; Fri, 27 Aug 2021 18:33:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65E5D185A79C
	for <dm-devel@redhat.com>; Fri, 27 Aug 2021 18:33:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-562-xnDRGpLCMnmpTSEAUEujPQ-1; Fri, 27 Aug 2021 14:33:48 -0400
X-MC-Unique: xnDRGpLCMnmpTSEAUEujPQ-1
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
	(Red Hat Linux)) id 1mJgeq-00Cxw6-V7; Fri, 27 Aug 2021 18:32:52 +0000
Date: Fri, 27 Aug 2021 11:32:52 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YSkv1GtmFgvQ81Up@bombadil.infradead.org>
References: <20210823202930.137278-1-mcgrof@kernel.org>
	<20210823202930.137278-6-mcgrof@kernel.org>
	<YSSNIaYpUhrkvC+J@infradead.org>
MIME-Version: 1.0
In-Reply-To: <YSSNIaYpUhrkvC+J@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: ulf.hansson@linaro.org, snitzer@redhat.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, dm-devel@redhat.com,
	agk@redhat.com, beanhuo@micron.com, ming.lei@redhat.com,
	sagi@grimberg.me, linux-scsi@vger.kernel.org, jejb@linux.ibm.com,
	josef@toxicpanda.com, nbd@other.debian.org,
	linux-block@vger.kernel.org, avri.altman@wdc.com,
	kbusch@kernel.org, swboyd@chromium.org, bvanassche@acm.org,
	axboe@kernel.dk, martin.petersen@oracle.com,
	linux-mmc@vger.kernel.org, adrian.hunter@intel.com
Subject: Re: [dm-devel] [PATCH 05/10] nvme: add error handling support for
	add_disk()
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 24, 2021 at 07:09:37AM +0100, Christoph Hellwig wrote:
> On Mon, Aug 23, 2021 at 01:29:25PM -0700, Luis Chamberlain wrote:
> > +	rc = device_add_disk(ctrl->device, ns->disk, nvme_ns_id_attr_groups);
> > +	if (rc)
> > +		goto out_cleanup_ns_from_list;
> > +
> 
> Nit: no real need for the rc variable here as we never use the actual
> value.

Alrighty.

> >  	if (!nvme_ns_head_multipath(ns->head))
> >  		nvme_add_ns_cdev(ns);
> >  
> > @@ -3785,6 +3789,10 @@ static void nvme_alloc_ns(struct nvme_ctrl *ctrl, unsigned nsid,
> >  
> >  	return;
> >  
> > + out_cleanup_ns_from_list:
> > +	down_write(&ctrl->namespaces_rwsem);
> > +	list_del_init(&ns->list);
> > +	up_write(&ctrl->namespaces_rwsem);
> 
> This also needs to do a nvme_put_ctrl.

Fixed.

  Luis

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

