Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A6D98320EAA
	for <lists+dm-devel@lfdr.de>; Mon, 22 Feb 2021 01:16:52 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-vWwzaDrVPdGQPxvBD191GQ-1; Sun, 21 Feb 2021 19:16:49 -0500
X-MC-Unique: vWwzaDrVPdGQPxvBD191GQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B1B88030CC;
	Mon, 22 Feb 2021 00:16:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FFD560C04;
	Mon, 22 Feb 2021 00:16:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C57124EE7F;
	Mon, 22 Feb 2021 00:16:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11M0Fvm2009796 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 21 Feb 2021 19:15:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3976B44004; Mon, 22 Feb 2021 00:15:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32BF63322A
	for <dm-devel@redhat.com>; Mon, 22 Feb 2021 00:15:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F35B39291A0
	for <dm-devel@redhat.com>; Mon, 22 Feb 2021 00:15:54 +0000 (UTC)
Received: from mail108.syd.optusnet.com.au (mail108.syd.optusnet.com.au
	[211.29.132.59]) by relay.mimecast.com with ESMTP id
	us-mta-212-124kmTP7M1e2isfKWryocw-1; Sun, 21 Feb 2021 19:15:50 -0500
X-MC-Unique: 124kmTP7M1e2isfKWryocw-1
Received: from dread.disaster.area (pa49-179-130-210.pa.nsw.optusnet.com.au
	[49.179.130.210])
	by mail108.syd.optusnet.com.au (Postfix) with ESMTPS id 7E7221ADB51;
	Mon, 22 Feb 2021 10:52:49 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1lDyWu-00Fq01-QV; Mon, 22 Feb 2021 10:52:48 +1100
Date: Mon, 22 Feb 2021 10:52:48 +1100
From: Dave Chinner <david@fromorbit.com>
To: SelvaKumar S <selvakuma.s1@samsung.com>
Message-ID: <20210221235248.GZ4626@dread.disaster.area>
References: <CGME20210219124555epcas5p1334e7c4d64ada5dc4a2ca0feb48c1d44@epcas5p1.samsung.com>
	<20210219124517.79359-1-selvakuma.s1@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20210219124517.79359-1-selvakuma.s1@samsung.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=YKPhNiOx c=1 sm=1 tr=0 cx=a_idp_d
	a=JD06eNgDs9tuHP7JIKoLzw==:117 a=JD06eNgDs9tuHP7JIKoLzw==:17
	a=kj9zAlcOel0A:10 a=qa6Q16uM49sA:10 a=pNaSbsGRAAAA:8 a=7-415B0cAAAA:8
	a=bdcsEvdjF_AAMq5uHxAA:9 a=CjuIK1q_8ugA:10 a=k8uaQqolKd8A:10
	a=cz0TccRYsqG1oLvFGeGV:22 a=biEYGPWJfzWAr4FL6Ov7:22
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
Cc: axboe@kernel.dk, damien.lemoal@wdc.com, kch@kernel.org, sagi@grimberg.me,
	snitzer@redhat.com, selvajove@gmail.com,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	nj.shetty@samsung.com, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	joshi.k@samsung.com, javier.gonz@samsung.com, kbusch@kernel.org,
	joshiiitr@gmail.com, hch@lst.de
Subject: Re: [dm-devel] [RFC PATCH v5 0/4] add simple copy support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 19, 2021 at 06:15:13PM +0530, SelvaKumar S wrote:
> This patchset tries to add support for TP4065a ("Simple Copy Command"),
> v2020.05.04 ("Ratified")
> 
> The Specification can be found in following link.
> https://nvmexpress.org/wp-content/uploads/NVM-Express-1.4-Ratified-TPs-1.zip
> 
> Simple copy command is a copy offloading operation and is  used to copy
> multiple contiguous ranges (source_ranges) of LBA's to a single destination
> LBA within the device reducing traffic between host and device.
> 
> This implementation doesn't add native copy offload support for stacked
> devices rather copy offload is done through emulation. Possible use
> cases are F2FS gc and BTRFS relocation/balance.

It sounds like you are missing the most obvious use case for this:
hooking up filesystem copy_file_range() implementations to allow
userspace to offload user data copies to hardware....

Another fs level feature that could use this for hardware
acceleration fallocate(FALLOC_FL_UNSHARE).

These are probably going to be far easier to hook up than filesystem
GC algorithms, and there is also solid data integrity and stress
testing checking infrastructure for these operations via fstests.

> As SCSI XCOPY can take two different block devices and no of source range is
> equal to 1, this interface can be extended in future to support SCSI XCOPY.

That greatly complicates the implementation. do we even care at this
point about cross-device XCOPY at this point?

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

