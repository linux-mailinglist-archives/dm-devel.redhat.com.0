Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A522C2950B0
	for <lists+dm-devel@lfdr.de>; Wed, 21 Oct 2020 18:25:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-Ti03ZnflN0KGrkI34yY6CQ-1; Wed, 21 Oct 2020 12:25:17 -0400
X-MC-Unique: Ti03ZnflN0KGrkI34yY6CQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D126B80B702;
	Wed, 21 Oct 2020 16:25:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80C785B4BC;
	Wed, 21 Oct 2020 16:25:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41F68922E1;
	Wed, 21 Oct 2020 16:24:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09LGONF6005541 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 21 Oct 2020 12:24:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6E7CB200E21C; Wed, 21 Oct 2020 16:24:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69341205EAE6
	for <dm-devel@redhat.com>; Wed, 21 Oct 2020 16:24:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A3ED805C20
	for <dm-devel@redhat.com>; Wed, 21 Oct 2020 16:24:21 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-179-pb1RF4YfNv-rPjRGn_m1Rg-1; Wed, 21 Oct 2020 12:24:18 -0400
X-MC-Unique: pb1RF4YfNv-rPjRGn_m1Rg-1
Received: by mail-ej1-f68.google.com with SMTP id c15so3015570ejs.0
	for <dm-devel@redhat.com>; Wed, 21 Oct 2020 09:24:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3gOwLOinKxfS8Q7pKCJNt4sF+c6ZgP4dy5YmMvKFVL4=;
	b=pUvat9H9BvGT2WwzLUCby6iBldUcKfvnbW3ZRYVp4VudHxlN2pZDFbzE0ROLE83MoU
	P17WD1zhpt3cXvd4xuaKowsmkNtQxxzk3Ylnnw++AvIAu+qcU67Pup4SMegp6ZJDT1d2
	m6uabkbsImrQF8Ul4XIRDL7BleVca7rozFXulkAxPA2FDrsW71uYnKlhe2PH2byXAyHl
	b2QGlmFnID5IsoO9RHBQNViQ9XwD9ey1PYy4JpdTLPXmKDORca2VKyvp2M5cB+K0dx94
	lAte6hDUOWlbHbM1gV48uoV7ypUlAeCDOqcAzrdoionIRDuWVsOjRpz+5sdQ82VAjeWg
	T7LA==
X-Gm-Message-State: AOAM530lyMsvLq2SEj0St4JAlQvoqW75p5H/Uk/CHMKK8whoqwhumj/w
	0FtKZuMuOZqAzDaeycQrxHh9cSnYhzrVJTHLjhuNdA==
X-Google-Smtp-Source: ABdhPJxdbZlz7qjHcsJyG3VwrTEzzzv1Xnm7a3x75REVedoliNewQfm4hBXe15u3vhqNhzOv2lGigBFvNc+AOMCjKO4=
X-Received: by 2002:a17:906:c20f:: with SMTP id
	d15mr4164002ejz.341.1603297457480; 
	Wed, 21 Oct 2020 09:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201012162736.65241-1-nmeeramohide@micron.com>
	<20201015080254.GA31136@infradead.org>
	<SN6PR08MB420880574E0705BBC80EC1A3B3030@SN6PR08MB4208.namprd08.prod.outlook.com>
	<CAPcyv4j7a0gq++rL--2W33fL4+S0asYjYkvfBfs+hY+3J=c_GA@mail.gmail.com>
	<CAMM=eLf+2VYHB6vZVjn_=GA5uXJWKL-d6PuCpHEBPz=_Loe58A@mail.gmail.com>
In-Reply-To: <CAMM=eLf+2VYHB6vZVjn_=GA5uXJWKL-d6PuCpHEBPz=_Loe58A@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 21 Oct 2020 09:24:06 -0700
Message-ID: <CAPcyv4hj2iPmf4YNdJLZqHMh2B10hbkSnk_9BAAACbG_LFKfBQ@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"Steve Moyer \(smoyer\)" <smoyer@micron.com>,
	"linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
	"John Groves \(jgroves\)" <jgroves@micron.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	device-mapper development <dm-devel@redhat.com>,
	"Nabeel Meeramohideen Mohamed \(nmeeramohide\)" <nmeeramohide@micron.com>,
	"Pierre Labat \(plabat\)" <plabat@micron.com>,
	"Greg Becker \(gbecker\)" <gbecker@micron.com>
Subject: Re: [dm-devel] [EXT] Re: [PATCH v2 00/22] add Object Storage Media
	Pool (mpool)
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 21, 2020 at 7:24 AM Mike Snitzer <snitzer@redhat.com> wrote:
>
> Hey Dan,
>
> On Fri, Oct 16, 2020 at 6:38 PM Dan Williams <dan.j.williams@intel.com> wrote:
> >
> > On Fri, Oct 16, 2020 at 2:59 PM Nabeel Meeramohideen Mohamed
> > (nmeeramohide) <nmeeramohide@micron.com> wrote:
> >
> > > (5) Representing an mpool as a /dev/mpool/<mpool-name> device file provides a
> > > convenient mechanism for controlling access to and managing the multiple storage
> > > volumes, and in the future pmem devices, that may comprise an logical mpool.
> >
> > Christoph and I have talked about replacing the pmem driver's
> > dependence on device-mapper for pooling.
>
> Was this discussion done publicly or private?  If public please share
> a pointer to the thread.
>
> I'd really like to understand the problem statement that is leading to
> pursuing a pmem native alternative to existing DM.
>

IIRC it was during the hallway track at a conference. Some of the
concern is the flexibility to carve physical address space but not
attach a block-device in front of it, and allow pmem/dax-capable
filesystems to mount on something other than a block-device.

DM does fit the bill for block-device concatenation and striping, but
there's some pressure to have a level of provisioning beneath that.

The device-dax facility has already started to grow some physical
address space partitioning capabilities this cycle, see 60e93dc097f7
device-dax: add dis-contiguous resource support, and the question
becomes when / if that support needs to extend across regions is DM
the right tool for that?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

