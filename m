Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC1A1CD3A5
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 10:19:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589185166;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wuvdIAFrNTEYzn8gX1nYH1uAAxT7rW34ANU3W0AQUBY=;
	b=V7hRY+BW6LsvzWeDd5DvA3HoZQiFiVS/430Rw75BQ+klMiqERVMap4gaGiLB7ikxoO+OZ4
	cSuOy4mbtCJDD4K4NaTnjqgDbYRS1lkoxw8Ty1dJIEfz4PPU+3J758YrV+Z5076Ey+PIav
	rYqP3QIgCiT0/xFlskxhVtXohdeWJNg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-8_1Msny2Oam-xYgJEkEfWg-1; Mon, 11 May 2020 04:19:24 -0400
X-MC-Unique: 8_1Msny2Oam-xYgJEkEfWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 527B5EC1AD;
	Mon, 11 May 2020 08:19:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2746B70944;
	Mon, 11 May 2020 08:19:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B01FE4CAAD;
	Mon, 11 May 2020 08:19:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 049G1dBr000919 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 9 May 2020 12:01:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 308DD2029F61; Sat,  9 May 2020 16:01:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CCDB2029F60
	for <dm-devel@redhat.com>; Sat,  9 May 2020 16:01:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 675DE8995D1
	for <dm-devel@redhat.com>; Sat,  9 May 2020 16:01:36 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-285-Ocu_eZsTN9qBzf8i2z-16A-1; Sat, 09 May 2020 12:01:33 -0400
X-MC-Unique: Ocu_eZsTN9qBzf8i2z-16A-1
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 6717B5C00ED;
	Sat,  9 May 2020 12:01:32 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
	by compute4.internal (MEProxy); Sat, 09 May 2020 12:01:32 -0400
X-ME-Sender: <xms:29O2XocUXLF5hFPCQQYzhuVm0jVK7QnFzdHJzMNkXUo-W7Y6jD1svQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkeehgdelhecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpehkjhesohhr
	sggvkhhkrdgtohhmnecuggftrfgrthhtvghrnhepteehuefhudevvdeflefgfeevuefhje
	fgjeekffefjeelvdetieevffelvdelkeeknecuvehluhhsthgvrhfuihiivgeptdenucfr
	rghrrghmpehmrghilhhfrhhomhepkhhjsehorhgsvghkkhdrtghomh
X-ME-Proxy: <xmx:29O2Xuf8Pt7JkSYiuu4NccR0TxExtTCUsDiJz0er_aKOIsCdX_kRMw>
	<xmx:29O2XkglqHASt0OzAYSMJuv22PtQB2mWCRS3f-ggrBkhfzNFhUDT5g>
	<xmx:29O2XiSZdebnkCAmOLpndBxBguYVX3GkS4F-jD4DW7C8wLbc9SIQYw>
	<xmx:3NO2XkVMTD1WOasQWeDAT7XM06Je1KvCw5snmCK50aCfd-kgvwfCJg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8C796C200A4; Sat,  9 May 2020 12:01:31 -0400 (EDT)
User-Agent: Cyrus-JMAP/3.3.0-dev0-413-g750b809-fmstable-20200507v1
Mime-Version: 1.0
Message-Id: <bc077a4c-26ce-4fd1-b55c-48bded3c834b@www.fastmail.com>
In-Reply-To: <20200508210926.GB19773@redhat.com>
References: <20200507230532.5733-1-kj@orbekk.com>
	<DM6PR04MB49726E28257263F5A1C643B386A20@DM6PR04MB4972.namprd04.prod.outlook.com>
	<dd7b8b91-776b-4458-a83a-18ab4953d2f4@www.fastmail.com>
	<20200508210926.GB19773@redhat.com>
Date: Sat, 09 May 2020 12:01:10 -0400
From: kj@orbekk.com
To: "Mike Snitzer" <snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 11 May 2020 04:18:30 -0400
Cc: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>,
	"harshads@google.com" <harshads@google.com>,
	Khazhismel Kumykov <khazhy@google.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] dm: track io errors per mapped device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 8, 2020, at 17:09, Mike Snitzer wrote:
> On Fri, May 08 2020 at  3:22pm -0400,
> kj@orbekk.com <kj@orbekk.com> wrote:
> 
> > On Thu, May 7, 2020, at 21:12, Chaitanya Kulkarni wrote:
> > > On 05/07/2020 04:06 PM, Kjetil Orbekk wrote:
> > > > +		if (tio->error)
> > > > +			atomic_inc(&md->ioerr_cnt);
> > > 
> > > Given that there are so many errors how would user know what
> > > kind of error is generated and how many times?
> > 
> > The intended use case is to provide an easy way to check if errors
> > have occurred at all, and then the user needs to investigate using
> > other means. I replied with more detail to Alasdair's email.
> 
> But most operations initiated by the user that fail will be felt by the
> upper layer that the user is interfacing with.
> 
> Only exception that springs to mind is dm-writecache's writeback that
> occurs after writes have already been acknowledged back to the upper
> layers -- in that case dm-writecache provides an error flag that is
> exposed via writecache_status.
> 
> Anyway, just not seeing why you need a upper-layer use-case agnostic
> flag to know an error occurred in DM.  That layers that interface with
> the DM device will have been notified of all errors.

It's used as a signal by a probing process which is not in the IO path itself.

> And why just for DM devices?  Why not all block devices (in which case
> DM would get this feature "for free")?

This sounds like a good idea to me. Looks like I could add this to disk_stats and expose it through the block/<device>/stats file. I'll try to see if this is feasible.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

