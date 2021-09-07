Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0A768403079
	for <lists+dm-devel@lfdr.de>; Tue,  7 Sep 2021 23:52:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631051563;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tkHnaUh5mS0X0b0QTzNQkAPdIxvWeyGZepZ4SjOMdZ8=;
	b=VmFMDOPxobZxn0SqktTwLpSWOdX8YWv+NIOOBDYvjkwZ0ljlBQ5XlefiksCOG80STS/ihN
	aMFIuCOv0G0WeL45PX3MFJ7WeqfjENoQQbu0/D5ClnCuxi4ymBxTH1Qq+fgRXavojABuOO
	LrJhQMNUDz+PHD8TJm0tVBoTmwFtBY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-vrTk0_M3NjG4raovKfNk-A-1; Tue, 07 Sep 2021 17:52:41 -0400
X-MC-Unique: vrTk0_M3NjG4raovKfNk-A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E58321006C92;
	Tue,  7 Sep 2021 21:52:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A746719739;
	Tue,  7 Sep 2021 21:52:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 091AE46F4B;
	Tue,  7 Sep 2021 21:52:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 187Lq1JV032589 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Sep 2021 17:52:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F15B06A8E4; Tue,  7 Sep 2021 21:52:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEDC86A908;
	Tue,  7 Sep 2021 21:51:58 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 187LpuMa014609; 
	Tue, 7 Sep 2021 16:51:56 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 187Lptwl014608;
	Tue, 7 Sep 2021 16:51:55 -0500
Date: Tue, 7 Sep 2021 16:51:55 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210907215155.GI3087@octiron.msp.redhat.com>
References: <20210907065636.22937-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210907065636.22937-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 0/3] multipath-tools: final touces before
	next PR
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 07, 2021 at 08:56:33AM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

for the set.

> 
> Hello Christophe, hello Ben,
> 
> here are a few final small fixes for the next multipath-tools PR:
> https://github.com/opensvc/multipath-tools/pull/13
> 
> (Christophe, please give Ben a few days for review before merging).
> 
> Notes:
> 
>  - The patch for libmultipath.version differs from the one I posted
>    previously (https://listman.redhat.com/archives/dm-devel/2021-September/msg00011.html).
>    In the previous one I hadn't sticked to the guide line I had
>    set up myself (bumping the version of every symbol in the ABI
>    for incompatible changes). The previous patch (bumping only the
>    version of the symbols that had actually changed) has some advantages,
>    in particular being able to track which symbols actually differ between
>    versions. We may want to discuss changing the policy towards
>    this procedure in the future, but we can't do it silently like I did
>    in the first version of this patch.
>  - I wrote previously that "libmultipath: drop unnecessary parameter 
>    from remove_map()" broke the directio test, but that was a braino.
>    It broke the dmevents tests. The fix is in this series.
> 
> Regards,
> Martin
> 
> Martin Wilck (3):
>   libmultipath.version: adapt to changes in remove_map
>   multipath-tools tests: fix dmevents test
>   Update .gitignore
> 
>  .gitignore                        |  4 ++++
>  libmultipath/libmultipath.version | 17 +++++++----------
>  tests/dmevents.c                  |  4 +---
>  3 files changed, 12 insertions(+), 13 deletions(-)
> 
> -- 
> 2.33.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

