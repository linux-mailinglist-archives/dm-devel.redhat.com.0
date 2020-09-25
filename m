Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 93A06277DD7
	for <lists+dm-devel@lfdr.de>; Fri, 25 Sep 2020 04:10:31 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600999830;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1fS5lGbpi6Eu5EFlgh5WjkgGyWDh8AIGIC0nVlio6qU=;
	b=PRn7iBeQTeiZmfjs6RnVZSLH1LO183tWRp4GE+w9AnoVTwgOR9p60bP31hzN3esUdNpgHW
	UBEmY+0S56SW9ejcsD3arDvQT2rDmT8iDoooIssWQkj3Lkm1JYs9NGrXctWfC9Yr1vKm5g
	7ys/QZML0qLti6KHg5G+Gzdg/Z2YOik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-XpwrEDlbMHGt1PC3pWwayw-1; Thu, 24 Sep 2020 22:10:28 -0400
X-MC-Unique: XpwrEDlbMHGt1PC3pWwayw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CF7D188C122;
	Fri, 25 Sep 2020 02:10:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBC8D60C15;
	Fri, 25 Sep 2020 02:10:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 09D621826D2A;
	Fri, 25 Sep 2020 02:10:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08P2A0R2017355 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 22:10:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 765975D9DD; Fri, 25 Sep 2020 02:10:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A6B15D9F1;
	Fri, 25 Sep 2020 02:09:57 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08P29ugE024726; 
	Thu, 24 Sep 2020 21:09:56 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08P29t9v024725;
	Thu, 24 Sep 2020 21:09:55 -0500
Date: Thu, 24 Sep 2020 21:09:55 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200925020955.GM11108@octiron.msp.redhat.com>
References: <20200924133644.14034-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200924133644.14034-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 00/11] multipath-tools: add linker version
	scripts
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24, 2020 at 03:36:33PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Hi Christophe, hi Ben,
> 
> Patch 1-5 are small fixes, the first two resent from an earlier
> submission. Patch 6ff. add version scripts for the linker to
> libmultipath, libmpathpersist, and libmpathcmd.
> 
> Is it useful to do this for libmultipath? We have always said that this is
> not a public, stable ABI. However, I still believe it has merits. First of
> all, it's a description of the ABI we use. It turns out that it cuts the
> size of the exported symbol list of libmultipath roughly in half, which is
> better than I'd expected. It leads to ld.so-time failure rather than weird
> crashes in the unlikely case that non-matching binaries are used
> together. It allows packaging scripts to check compatibility of binaries
> and libraries without resorting to version and release. It will help us
> stabilize the ABI, albeit only in the long run. Finally, it's a step
> towards modernizing our code base in general.
> 
> To avoid misunderstanding, my intention is not to provide a stable or even
> backward-compatible ABI in libmultipath.so.0. We're still allowed to make
> changes to globally visible data structures like "struct config", and to
> remove symbols from the ABI, like no serious shared library would do.
> We just need to bump the ABI version when we do so.
> 

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
For this patchset, except for 0002 and 0008

> Regards,
> Martin
> 
> Martin Wilck (11):
>   libmultipath: find_mpe(): don't match with empty WWID
>   libmultipath: copy mpp->hwe from pp->hwe
>   libmultipath: dm_map_present_by_uuid(): fix dm_task_create() call
>   libdmmp tests: fix compilation
>   libmultipath: prio: constify some function parameters
>   libmultipath: checkers/prio: allow non-lazy .so loading
>   multipath-tools Makefiles: separate rules for .so and man pages
>   libmultipath: create separate .so for unit tests
>   libmultipath: add linker version script
>   libmpathpersist: add linker version script
>   libmpathcmd: add linker version script
> 
>  libdmmp/test/libdmmp_speed_test.c       |   2 +-
>  libdmmp/test/libdmmp_test.c             |   2 +-
>  libmpathcmd/Makefile                    |  14 +-
>  libmpathcmd/libmpathcmd.version         |  13 ++
>  libmpathpersist/Makefile                |  16 +-
>  libmpathpersist/libmpathpersist.version |  20 +++
>  libmultipath/Makefile                   |  22 ++-
>  libmultipath/checkers.c                 |  17 ++
>  libmultipath/config.c                   |   2 +-
>  libmultipath/configure.c                |   7 +
>  libmultipath/devmapper.c                |   2 +-
>  libmultipath/libmultipath.version       | 215 ++++++++++++++++++++++++
>  libmultipath/prio.c                     |  26 ++-
>  libmultipath/prio.h                     |   4 +-
>  libmultipath/propsel.c                  |   4 +-
>  libmultipath/structs.c                  |  15 ++
>  libmultipath/structs.h                  |   1 +
>  libmultipath/structs_vec.c              |  54 +++---
>  multipathd/main.c                       |  10 --
>  tests/Makefile                          |  10 +-
>  20 files changed, 384 insertions(+), 72 deletions(-)
>  create mode 100644 libmpathcmd/libmpathcmd.version
>  create mode 100644 libmpathpersist/libmpathpersist.version
>  create mode 100644 libmultipath/libmultipath.version
> 
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

