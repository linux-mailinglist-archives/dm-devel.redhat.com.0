Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 47BC510A15B
	for <lists+dm-devel@lfdr.de>; Tue, 26 Nov 2019 16:41:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574782898;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pWAl4jxaxIGd/l1ThnrmQteaPAYPv8hadub1+/KcVYU=;
	b=UXv6y8KqQbdI1q1eHBFmV94O3ee7/fdLzvLSOpWAXiSc3hVEXMu7dE/gOOmMkEJ14H1auO
	+SEaGqtIB39UdX43JfxzBoKw0HL3OZqoR7ifalqmoPVMacJdB7Xhor5nYce/6CxP/k42VH
	nT1npEJ4w53mNkwIIPN0JKeBOMCWfbo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-k4vuI7tqPIaAx2HkVx7k9A-1; Tue, 26 Nov 2019 10:41:36 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 964278017CC;
	Tue, 26 Nov 2019 15:41:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A9A4608BF;
	Tue, 26 Nov 2019 15:41:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D23D18034EA;
	Tue, 26 Nov 2019 15:41:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAQFerFQ013854 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 26 Nov 2019 10:40:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 29B251001B3F; Tue, 26 Nov 2019 15:40:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3203610016E8;
	Tue, 26 Nov 2019 15:40:49 +0000 (UTC)
Date: Tue, 26 Nov 2019 10:40:49 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <20191126154048.GB2025@redhat.com>
References: <2044145.ITN4Tc4rAJ@archlinux>
	<6635828b-2ca6-c4d4-fc70-46e9a0bd2ed5@arrikto.com>
MIME-Version: 1.0
In-Reply-To: <6635828b-2ca6-c4d4-fc70-46e9a0bd2ed5@arrikto.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: diegocg@gmail.com, dm-devel@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] dm clone: Add to the documentation index
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
X-MC-Unique: k4vuI7tqPIaAx2HkVx7k9A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Nov 26 2019 at  7:00am -0500,
Nikos Tsironis <ntsironis@arrikto.com> wrote:

> From: Diego Calleja <diegocg@gmail.com>
> 
> It was missing from the initial commit
> 
> Signed-off-by: Diego Calleja <diegocg@gmail.com>
> 
> ---
>  Documentation/admin-guide/device-mapper/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/admin-guide/device-mapper/index.rst b/
> Documentation/admin-guide/device-mapper/index.rst
> index c77c58b8f67b..d8dec8911eb3 100644
> --- a/Documentation/admin-guide/device-mapper/index.rst
> +++ b/Documentation/admin-guide/device-mapper/index.rst
> @@ -8,6 +8,7 @@ Device Mapper
>      cache-policies
>      cache
>      delay
> +    dm-clone
>      dm-crypt
>      dm-flakey
>      dm-init
> -- 
> 2.24.0

I've picked this up:
https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.5&id=484e0d2b11e1fdd0d17702b282eb2ed56148385f

Nikos, please note that if you send a patch on someone else's behalf you
should add you Signed-off-by.  I've updated the commit header
accordingly.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

