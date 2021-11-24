Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8F245B2DF
	for <lists+dm-devel@lfdr.de>; Wed, 24 Nov 2021 04:52:05 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-4OypF1SIMweheH6oqyj1KQ-1; Tue, 23 Nov 2021 22:52:01 -0500
X-MC-Unique: 4OypF1SIMweheH6oqyj1KQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D37C57201;
	Wed, 24 Nov 2021 03:51:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76DFB5DF2E;
	Wed, 24 Nov 2021 03:51:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 168964A7C9;
	Wed, 24 Nov 2021 03:51:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AO3pU5X022308 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 23 Nov 2021 22:51:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8B9F32166B25; Wed, 24 Nov 2021 03:51:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83B162166B2D
	for <dm-devel@redhat.com>; Wed, 24 Nov 2021 03:51:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94AA1811E78
	for <dm-devel@redhat.com>; Wed, 24 Nov 2021 03:51:27 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-506-31I654HvNYKE3xE73yvU5g-1; Tue, 23 Nov 2021 22:51:25 -0500
X-MC-Unique: 31I654HvNYKE3xE73yvU5g-1
Received: by mail-pl1-f180.google.com with SMTP id p18so725887plf.13
	for <dm-devel@redhat.com>; Tue, 23 Nov 2021 19:51:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uJJrE2V7YDKia68Ncdl0fsAelSVdGw1v9JUEXR7xY5Y=;
	b=ePtG0dHzShtejNy5dFyBLvapHWaFg0pzjifhT8IiqRsZhH0pPNrdLe2a+hZh/8pbYO
	/cUVyDEQFxVgAsmE1SN5A1QPc5Bp0X/5LoM3jSrIBKHvN6nZEJTPdQOEv8qPsdAX6Oal
	xDa2k8qbSWiTwAz7VbYacX5tEaUgwc2D7487ZTSV9RvSUa2kxVcN9+6J0O8j2YIHz6fK
	kydtVra429WYU8U3bBsqFV1DiuY2JHIc78RleIaCOBioBAY1W5ZvhypsJTnwyHetdA/k
	7mUa59so90YM/XeCunssCZGFLySeyHPB/uKdcZCtCII589jdcOB4htLbtz1uKcG2Dmxd
	VhvA==
X-Gm-Message-State: AOAM530NDQ6uOoVJR/hCxFF45VEAT6jMSOgqLaM36owsb0/So9UlQuW8
	5BeQ6M75Gr/IsWWFUyS16jxPS2vF56goJeMTRWY17w==
X-Google-Smtp-Source: ABdhPJzAHmbz7abbV3IfUPlG+M3Adum2An1EImXm+0nyzeG+6b50syE8SI9jQ3gftFqA5yglDnQ0v4N9/X3Fjpc01Ms=
X-Received: by 2002:a17:90b:1e07:: with SMTP id
	pg7mr4029053pjb.93.1637725884625; 
	Tue, 23 Nov 2021 19:51:24 -0800 (PST)
MIME-Version: 1.0
References: <20211109083309.584081-1-hch@lst.de>
	<20211109083309.584081-29-hch@lst.de>
In-Reply-To: <20211109083309.584081-29-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 23 Nov 2021 19:51:14 -0800
Message-ID: <CAPcyv4iV+PTdvV+Tq5j3nR6UWFQPTeuzQrZGdS24HdVehY_OaA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, Mike Snitzer <snitzer@redhat.com>,
	linux-s390 <linux-s390@vger.kernel.org>, linux-erofs@lists.ozlabs.org,
	virtualization@lists.linux-foundation.org,
	linux-xfs <linux-xfs@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-ext4 <linux-ext4@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>
Subject: Re: [dm-devel] [PATCH 28/29] iomap: build the block based code
	conditionally
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 9, 2021 at 12:34 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Only build the block based iomap code if CONFIG_BLOCK is set.  Currently
> that is always the case, but it will change soon.

Looks good.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

