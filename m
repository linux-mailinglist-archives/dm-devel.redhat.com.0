Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 86BBD29642A
	for <lists+dm-devel@lfdr.de>; Thu, 22 Oct 2020 19:55:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603389336;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5PiyJt2uNQaiJKN/TToLYoRSTXPp4e2gUXWTR3EmZ6o=;
	b=Qgr1KnhQOFtf+5ovn9IyO1rvPCQQxFJcki5dKAsA0YghjqiDoJxzZrAE/u8X4m+yLINotR
	vvON9qz3NX3qC98Cn+GQtiNqNViHVJea1gXGXU/o0kMI7pF/y6xZsstST5aze1i4lQXv9s
	voJsTICzspgfBi7ziu2buPDNnKOTcso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-R2cEsfbROOK5CoilxSE8FQ-1; Thu, 22 Oct 2020 13:55:33 -0400
X-MC-Unique: R2cEsfbROOK5CoilxSE8FQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E815804B6A;
	Thu, 22 Oct 2020 17:55:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3974C10023A5;
	Thu, 22 Oct 2020 17:55:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 96F74181A06B;
	Thu, 22 Oct 2020 17:54:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09MHsaGq026761 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 22 Oct 2020 13:54:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C03952156A3C; Thu, 22 Oct 2020 17:54:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB31C2156A36
	for <dm-devel@redhat.com>; Thu, 22 Oct 2020 17:54:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5347811E8F
	for <dm-devel@redhat.com>; Thu, 22 Oct 2020 17:54:33 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-30-mrwpPTI9NHuue-WgT_yUbg-1; Thu, 22 Oct 2020 13:54:29 -0400
X-MC-Unique: mrwpPTI9NHuue-WgT_yUbg-1
Received: by mail-pj1-f68.google.com with SMTP id a17so1453498pju.1;
	Thu, 22 Oct 2020 10:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jZuHlEwh3g7UcDcJaONWe8EfIxBYtT9I7AYk4QdFzwc=;
	b=s3t//qeEczMbAjjavOoP7VBNIyL+itVjWJH7cckZHHDS1LPkm/2jsjgP2g5ij26321
	sb6291Yy/ClWuy3vdEzhRBwl6yGtUgt0eYfHKD4i28UM3FHLxpm1oiSp2pl06lAlmql8
	yE0tL/hFnFfsxixjnMS3zTaXuAwCSyPjBMDap3vmI02N5tNLRagmCsBCV6cfNlB9vaNF
	dC8ZvTNzUVT7grWSq2ZZbLcFk667gRCcFFj9ImvWTwtwQiLPzE053HDa/wGlGfzg+asU
	sa7pGSchVv0u4ZKpw+/jIcp3SnCVcmlRFh34bQRW5ofaIsNoQo0la1/X5s9csnD3ywlX
	oZnA==
X-Gm-Message-State: AOAM531M7o3iPVgsAmEWUGPFRy1sAsAyDiFDLemoc5JLdgbskq5lENa1
	g08NcRSYTQshwUio/rOkhr0PtdyA4ROoohKJCqk=
X-Google-Smtp-Source: ABdhPJxcm7nxDfpt8QtfKwOARuDT6nuFczBSIqDJ7vYnHyrPosWkJvFSDvOcbTMeVUL5SpoaDYnY4onxzd0QAP3w2Bs=
X-Received: by 2002:a17:902:c254:b029:d4:c2d4:15f with SMTP id
	20-20020a170902c254b02900d4c2d4015fmr3651304plg.18.1603389267970;
	Thu, 22 Oct 2020 10:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <1603271049-20681-1-git-send-email-sergei.shtepa@veeam.com>
	<71926887-5707-04a5-78a2-ffa2ee32bd68@suse.de>
	<20201021141044.GF20749@veeam.com>
	<ca8eaa40-b422-2272-1fd9-1d0a354c42bf@suse.de>
	<20201022094402.GA21466@veeam.com>
	<BL0PR04MB6514AC1B1FF313E6A14D122CE71D0@BL0PR04MB6514.namprd04.prod.outlook.com>
	<20201022135213.GB21466@veeam.com> <20201022151418.GR9832@magnolia>
In-Reply-To: <20201022151418.GR9832@magnolia>
From: Mike Snitzer <snitzer@redhat.com>
Date: Thu, 22 Oct 2020 13:54:16 -0400
Message-ID: <CAMM=eLfO_L-ZzcGmpPpHroznnSOq_KEWignFoM09h7Am9yE83g@mail.gmail.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
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
Cc: "jack@suse.cz" <jack@suse.cz>,
	"gustavo@embeddedor.com" <gustavo@embeddedor.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	device-mapper development <dm-devel@redhat.com>,
	"pavel@ucw.cz" <pavel@ucw.cz>, "steve@sk2.org" <steve@sk2.org>,
	"osandov@fb.com" <osandov@fb.com>, Alasdair G Kergon <agk@redhat.com>,
	"bvanassche@acm.org" <bvanassche@acm.org>,
	"hch@infradead.org" <hch@infradead.org>,
	"len.brown@intel.com" <len.brown@intel.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"ming.lei@redhat.com" <ming.lei@redhat.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	Sergei Shtepa <sergei.shtepa@veeam.com>,
	"koct9i@gmail.com" <koct9i@gmail.com>, "axboe@kernel.dk" <axboe@kernel.dk>,
	Damien Le Moal <Damien.LeMoal@wdc.com>,
	Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
	"rjw@rjwysocki.net" <rjw@rjwysocki.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	"tj@kernel.org" <tj@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
Subject: Re: [dm-devel] [PATCH 0/2] block layer filter and block device
	snapshot module
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 22, 2020 at 11:14 AM Darrick J. Wong
<darrick.wong@oracle.com> wrote:
>
> On Thu, Oct 22, 2020 at 04:52:13PM +0300, Sergei Shtepa wrote:
> > The 10/22/2020 13:28, Damien Le Moal wrote:
> > > On 2020/10/22 18:43, Sergei Shtepa wrote:
> > > >
> > > > Maybe, but the problem is that I can't imagine how to implement
> > > > dm-intercept yet.
> > > > How to use dm to implement interception without changing the stack
> > > > of block devices. We'll have to make a hook somewhere, isn`t it?
> > >
> > > Once your dm-intercept target driver is inserted with "dmsetup" or any user land
> > > tool you implement using libdevicemapper, the "hooks" will naturally be in place
> > > since the dm infrastructure already does that: all submitted BIOs will be passed
> > > to dm-intercept through the "map" operation defined in the target_type
> > > descriptor. It is then that driver job to execute the BIOs as it sees fit.
> > >
> > > Look at simple device mappers like dm-linear or dm-flakey for hints of how
> > > things work (driver/md/dm-linear.c). More complex dm drivers like dm-crypt,
> > > dm-writecache or dm-thin can give you hints about more features of device mapper.
> > > Functions such as __map_bio() in drivers/md/dm.c are the core of DM and show
> > > what happens to BIOs depending on the the return value of the map operation.
> > > dm_submit_bio() and __split_and_process_bio() is the entry points for BIO
> > > processing in DM.
> > >
> >
> > Is there something I don't understand? Please correct me.
> >
> > Let me remind that by the condition of the problem, we can't change
> > the configuration of the block device stack.
> >
> > Let's imagine this configuration: /root mount point on ext filesystem
> > on /dev/sda1.
> > +---------------+
> > |               |
> > |  /root        |
> > |               |
> > +---------------+
> > |               |
> > | EXT FS        |
> > |               |
> > +---------------+
> > |               |
> > | block layer   |
> > |               |
> > | sda queue     |
> > |               |
> > +---------------+
> > |               |
> > | scsi driver   |
> > |               |
> > +---------------+
> >
> > We need to add change block tracking (CBT) and snapshot functionality for
> > incremental backup.
> >
> > With the DM we need to change the block device stack. Add device /dev/sda1
> > to LVM Volume group, create logical volume, change /etc/fstab and reboot.
> >
> > The new scheme will look like this:
> > +---------------+
> > |               |
> > |  /root        |
> > |               |
> > +---------------+
> > |               |
> > | EXT FS        |
> > |               |
> > +---------------+
> > |               |
> > | LV-root       |
> > |               |
> > +------------------+
> > |                  |
> > | dm-cbt & dm-snap |
> > |                  |
> > +------------------+
> > |               |
> > | sda queue     |
> > |               |
> > +---------------+
> > |               |
> > | scsi driver   |
> > |               |
> > +---------------+
> >
> > But I cannot change block device stack. And so I propose a scheme with
> > interception.
> > +---------------+
> > |               |
> > |  /root        |
> > |               |
> > +---------------+
> > |               |
> > | EXT FS        |
> > |               |
> > +---------------+   +-----------------+
> > |  |            |   |                 |
> > |  | blk-filter |-> | cbt & snapshot  |
> > |  |            |<- |                 |
> > |  +------------+   +-----------------+
> > |               |
> > | sda blk queue |
> > |               |
> > +---------------+
> > |               |
> > | scsi driver   |
> > |               |
> > +---------------+
> >
> > Perhaps I can make "cbt & snapshot" inside the DM, but without interception
> > in any case, it will not work. Isn't that right?
>
> Stupid question: Why don't you change the block layer to make it
> possible to insert device mapper devices after the blockdev has been set
> up?

Not a stupid question.  Definitely something that us DM developers
have wanted to do for a while.  Devil is in the details but it is the
right way forward.

Otherwise, this intercept is really just a DM-lite remapping layer
without any of DM's well established capabilities.  Encouragingly, all
of the replies have effectively echoed this point.  (amusingly, seems
every mailing list under the sun is on the cc except dm-devel... now
rectified)

Alasdair has some concrete ideas on this line of work; I'm trying to
encourage him to reply ;)

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

