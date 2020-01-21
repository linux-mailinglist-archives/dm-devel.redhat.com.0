Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DECED143D45
	for <lists+dm-devel@lfdr.de>; Tue, 21 Jan 2020 13:50:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579611018;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GG2RRBNjyerDxhQ3PCEvG01MpJqMZSIxVGv0Yf2G+xw=;
	b=OXm+FvRy7i+Ib/M0ZWs4c6AfQvWjLXfpXD67A81jWzPDHpJ6VdD4shSfnJRCbYuK2caDHS
	zmz0Q5UMFOg1+BiTP0z0r8+HXrfTIqnt5x/y1AJHptp5hr9b6gRl2LRCjm93Rnkd/YcyeS
	kCfr4oojjS3kp3Y5WCtLsgL7U/ZSVU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-KNQHk6XkNBObyTngFKW_Yg-1; Tue, 21 Jan 2020 07:50:16 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA33C1011190;
	Tue, 21 Jan 2020 12:50:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F433860D9;
	Tue, 21 Jan 2020 12:50:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A628418089C8;
	Tue, 21 Jan 2020 12:50:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00LCnsHE013727 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jan 2020 07:49:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 053621CB; Tue, 21 Jan 2020 12:49:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FDB084DB3;
	Tue, 21 Jan 2020 12:49:51 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 00LCno8H017287; 
	Tue, 21 Jan 2020 06:49:50 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 00LCnnaq017286;
	Tue, 21 Jan 2020 06:49:49 -0600
Date: Tue, 21 Jan 2020 06:49:49 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: John Stoffel <john@stoffel.org>
Message-ID: <20200121124949.GU30153@octiron.msp.redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-11-git-send-email-bmarzins@redhat.com>
	<24099.17365.933723.879139@quad.stoffel.home>
	<20200120150745.GO30153@octiron.msp.redhat.com>
	<24102.2942.443422.59933@quad.stoffel.home>
MIME-Version: 1.0
In-Reply-To: <24102.2942.443422.59933@quad.stoffel.home>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: Re: [dm-devel] [PATCH 10/15] libmultipath: change how the checker
 async is set
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: KNQHk6XkNBObyTngFKW_Yg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jan 20, 2020 at 03:20:14PM -0500, John Stoffel wrote:
> >>>>> "Benjamin" == Benjamin Marzinski <bmarzins@redhat.com> writes:
> 
> Benjamin> On Sat, Jan 18, 2020 at 12:43:49PM -0500, John Stoffel wrote:
> >> >>>>> "Benjamin" == Benjamin Marzinski <bmarzins@redhat.com> writes:
> >> 
> Benjamin> The way that the checkers async mode worked in multipathd didn't make
> Benjamin> much sense. When multipathd starts up, all checker classes are in the
> Benjamin> sync mode, and any pathinfo() calls on devices would run the checker in
> Benjamin> sync mode. However, the First time a checker class was used in
> Benjamin> checkerloop, it would set that checker class to async (assuming
> Benjamin> force_sync wasn't set).  After that, no matter when a checker from that
> Benjamin> class was called, it would always run in async mode.  Multipathd doesn't
> Benjamin> need to run checkers in sync mode at all, so don't.
> >> 
> >> Sorry, I had a hard time parsing this description, especially the last
> >> sentence.  Do you mean that checkers should default to async then,
> >> instead of sync mode?  And from looking at the code, don't you mean
> >> that you force sync mode?  I guess the question is whether checker
> >> classes should default sync, or async.  And if they move to async,
> >> should they stay there?
> >> 
> 
> Benjamin> Sorry. I mean that right now multipathd runs the checkers from pathinfo(),
> Benjamin> wait_for_pending_paths() and check_path(). When multipathd starts, all
> Benjamin> checkers are in sync mode. The first time a checker is run from
> Benjamin> check_path(), it is switched to async mode, and stays there for the rest
> Benjamin> of the time multipathd is runing.
> 
> Benjamin> There is no need for multipathd to run checkers in sync mode at all, so
> Benjamin> we shouldn't be doing so for these first checks.
> 
> Thanks, that makes the entire issue much more clear.  This raises the
> question of why there is a sync mode at all then?  In any case, the
> above makes the issue more understandable.

The multipath command, which uses the same checkers, runs in sync mode.

-Ben

> 
> John

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

