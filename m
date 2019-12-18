Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0D27A125374
	for <lists+dm-devel@lfdr.de>; Wed, 18 Dec 2019 21:28:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576700922;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6Tq/ZeieuVNuRXueemPCKtTHq/D5aFLY0ZttQreG5iE=;
	b=Ezz/Qgc/EjXP1eV8Wrjm9htJX1sXg5PFq1Af4v+84vTvF25Bbzq37N4BKKhp0ZvLedrdgS
	vmW0PQ8QE+XmrNVsHsQR5zUq2MwlEQYrmH/aI7GirDkD6fHw0ciR52AQf/3GLtQgX06ksb
	WZaHZsZmpSNtbphPcUjIW9NQb2ogQe0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-5inL83rdPmCp1mxSMkaZUA-1; Wed, 18 Dec 2019 15:28:38 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D940B107ACC5;
	Wed, 18 Dec 2019 20:28:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD87C5D9E2;
	Wed, 18 Dec 2019 20:28:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5E70018034EA;
	Wed, 18 Dec 2019 20:28:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBIKS4Le020220 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 18 Dec 2019 15:28:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0C42C2166B28; Wed, 18 Dec 2019 20:28:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0800F2166B2F
	for <dm-devel@redhat.com>; Wed, 18 Dec 2019 20:28:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6FD218E6C41
	for <dm-devel@redhat.com>; Wed, 18 Dec 2019 20:27:59 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [173.205.220.69]) by
	relay.mimecast.com with ESMTP id us-mta-429-0aZ0FOjoPU2RmbQLJRmzVA-1;
	Wed, 18 Dec 2019 15:27:58 -0500
Received: from localhost (localhost [127.0.0.1])
	by mx.ewheeler.net (Postfix) with ESMTP id F364AA0440;
	Wed, 18 Dec 2019 20:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at ewheeler.net
Received: from mx.ewheeler.net ([127.0.0.1])
	by localhost (mx.ewheeler.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kk_lUpTqpeVh; Wed, 18 Dec 2019 20:27:31 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [173.205.220.69])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx.ewheeler.net (Postfix) with ESMTPSA id C867BA0693;
	Wed, 18 Dec 2019 20:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.ewheeler.net C867BA0693
Date: Wed, 18 Dec 2019 20:27:26 +0000 (UTC)
From: Eric Wheeler <dm-devel@lists.ewheeler.net>
X-X-Sender: lists@mx.ewheeler.net
To: Joe Thornber <thornber@redhat.com>
In-Reply-To: <20191218131334.pngvyqoebsdmicun@reti>
Message-ID: <alpine.LRH.2.11.1912182024550.26683@mx.ewheeler.net>
References: <35cf1ecf-5cd8-604b-ec4e-18c9fd4a4195@linux.alibaba.com>
	<20191122185530.pcrgmb655dkdbdcq@reti>
	<629bd851-8d89-00bd-0fea-d140961e8752@arrikto.com>
	<alpine.LRH.2.11.1912130129120.11561@mx.ewheeler.net>
	<alpine.LRH.2.11.1912152140020.11561@mx.ewheeler.net>
	<20191218131334.pngvyqoebsdmicun@reti>
User-Agent: Alpine 2.11 (LRH 23 2013-08-11)
MIME-Version: 1.0
X-MC-Unique: 0aZ0FOjoPU2RmbQLJRmzVA-1
X-MC-Unique: 5inL83rdPmCp1mxSMkaZUA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBIKS4Le020220
X-loop: dm-devel@redhat.com
Cc: JeffleXu <jefflexu@linux.alibaba.com>, dm-devel@redhat.com,
	Nikos Tsironis <ntsironis@arrikto.com>
Subject: Re: [dm-devel] dm-thin: Several Questions on dm-thin performance.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 18 Dec 2019, Joe Thornber wrote:

> On Sun, Dec 15, 2019 at 09:44:49PM +0000, Eric Wheeler wrote:
> > I was looking through the dm-bio-prison-v2 commit for dm-cache (b29d4986d) 
> > and it is huge, ~5k lines.  Do you still have a git branch with these 
> > commits in smaller pieces (not squashed) so we can find the bits that 
> > might be informative for converting lv-thin to use dm-bio-prison-v2?
> > 
> > For example, I think that, at least, the policy changes and 
> > btracker code is dm-cache specific and just a distraction when trying to 
> > understand the dm-bio-prison-v2 conversion.
> 
> To be honest I would hold off for a couple of months.  I've been working
> on the design for thinp 2 and have got to the point where I need to write
> a userland proof of concept implementation.  In particular I've focussed on
> packing more into btree nodes, and separating transactions so IO to different
> thins has no locking contention.  The proof of concept will tell me just how
> small I can get the metadata.  If the level of metadata compression is ~1/10th
> we'll plug the new btrees into the existing design and switch to bio prison v2.
> If it's greater, say 1/50th, then I'll rewrite the whole target to
> use write-ahead logging for transactionality and ditch all metadata sharing altogether.
> When the metadata is that small we can copy entire btrees to implement snapshots.


Sounds great, looking forward to it.  The thinp target has worked great 
for us over the years.  Packing metadata and reducing lock contention will 
make it even better.

--
Eric Wheeler



> 
> - Joe
> 
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

