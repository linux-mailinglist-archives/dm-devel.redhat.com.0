Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 956EB1D42F8
	for <lists+dm-devel@lfdr.de>; Fri, 15 May 2020 03:32:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589506371;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ynW9g48lZH4YXnkpJm/qgcFEi8RaZGhEAaUp/W1Vixw=;
	b=h2aV2PDBj4+V6QNnQMbGhxT3dWEtNl1aheRvUgMMeJVYWqdyHSJZuTzWoBP42rX7kKa3rm
	n2z6ua8+SKQzn1IAgroqCY6kh0GDg1RvwQ8Z8F8m7BX0Qba+LHYQSiVlceADDvINhhp1sF
	uPdcYh92J/vNDZGZe8eNj8ZWHeBQHn4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-NZL7e33BMBWsR9y_t-X4Tw-1; Thu, 14 May 2020 21:32:48 -0400
X-MC-Unique: NZL7e33BMBWsR9y_t-X4Tw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E07BD64ADA;
	Fri, 15 May 2020 01:32:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B18510016E8;
	Fri, 15 May 2020 01:32:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 357E44E9B4;
	Fri, 15 May 2020 01:32:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04F1V4hV000966 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 21:31:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B78385C1D6; Fri, 15 May 2020 01:31:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A70765C1D3;
	Fri, 15 May 2020 01:31:01 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 04F1UxMl006651; 
	Thu, 14 May 2020 20:31:00 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 04F1UxIl006650;
	Thu, 14 May 2020 20:30:59 -0500
Date: Thu, 14 May 2020 20:30:58 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200515013058.GT5907@octiron.msp.redhat.com>
References: <20200511223931.18261-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200511223931.18261-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 00/11] Minor fixes for multipath-tools
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, May 12, 2020 at 12:39:20AM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Hi Christophe, hi Ben,
> 
> This series fixes a couple of issues I recently found with the 32bit build
> of multipath-tools, and after integrating our CI into the automated builds
> on our build server.
> 
> Regards
> Martin

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

For the set.

> 
> Martin Wilck (11):
>   multipath-tools: Makefile: more dependency fixes for parallel build
>   multipath-tools: Makefile.inc: separate out OPTFLAGS
>   multipath-tools: Makefile.inc: allow user settings for LDFLAGS
>   multipath-tools: Makefile.inc: set -Wno-error=clobbered
>   libmultipath: discovery.c: use %z qualifier for size_t
>   libmultipath: eliminate more signed/unsigned comparisons
>   libmultipath: set_uint: fix parsing for 32bit
>   multipath-tools tests/Makefile: add -lmpathcmd to LIBDEPS
>   multipath tools tests/Makefile: Fix OBJDEPS for hwtable-test
>   multipath-tools tests/test-lib.c: drop __wrap_is_claimed_by_foreign
>   multipath-tools tests/directio: fix -Wmaybe-uninitalized warning
> 
>  Makefile                              |  5 +++--
>  Makefile.inc                          | 16 ++++++++--------
>  libmpathpersist/mpath_pr_ioctl.c      |  2 +-
>  libmultipath/dict.c                   | 11 +++++++----
>  libmultipath/discovery.c              | 16 ++++++++--------
>  libmultipath/print.c                  | 12 ++++++------
>  libmultipath/prioritizers/alua_spc3.h |  2 +-
>  multipathd/cli_handlers.c             | 20 ++++++++++----------
>  multipathd/main.c                     |  2 +-
>  tests/Makefile                        |  4 ++--
>  tests/directio.c                      |  2 +-
>  tests/test-lib.c                      |  6 ------
>  12 files changed, 48 insertions(+), 50 deletions(-)
> 
> -- 
> 2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

