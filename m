Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD855A5262
	for <lists+dm-devel@lfdr.de>; Mon, 29 Aug 2022 18:58:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661792313;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bw8YTNTY3cVzKwH0Nt4nnk1MDWxoNlnTFQvVNE57UQ8=;
	b=Xt4ua32H/keEvx1Rysg4RUte80MWWQXnXX9wtDjSU3DZRO3ZHlpZ3X7cLqCrv8R/e8Bl71
	GBjXgrVMYUAVfUZfKrN1lT9lGwpwewdPrqmazd9DtqtZDZTGelQtdhcFxZYD7vjUWYLsFY
	0ug5l/YrY8A+PMWCT/8G9Yg3XNawOXQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-9f1sZPumMl-syQmvOH5org-1; Mon, 29 Aug 2022 12:58:29 -0400
X-MC-Unique: 9f1sZPumMl-syQmvOH5org-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C81AA299E767;
	Mon, 29 Aug 2022 16:58:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D74F2026D4C;
	Mon, 29 Aug 2022 16:58:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0ACDC1946A4E;
	Mon, 29 Aug 2022 16:58:27 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BA81C1946A40
 for <dm-devel@listman.corp.redhat.com>; Mon, 29 Aug 2022 16:58:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4A4D2C15BBD; Mon, 29 Aug 2022 16:58:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31B53C15BB3;
 Mon, 29 Aug 2022 16:58:25 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 27TGwNhK024036;
 Mon, 29 Aug 2022 11:58:23 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 27TGwNHA024035;
 Mon, 29 Aug 2022 11:58:23 -0500
Date: Mon, 29 Aug 2022 11:58:23 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20220829165822.GF16874@octiron.msp.redhat.com>
References: <20220822212251.9230-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20220822212251.9230-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [dm-devel] [PATCH v3 00/11] Split libmultipath and libmpathutil
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: dm-devel@redhat.com, Xose Vazquez Perez <xose.vazquez@gmail.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 22, 2022 at 11:22:49PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> The CI found a few more glitches in my v2 patch set. Not reposting
> the entire set here, just the changed patches.

For all except 01/11 & 10/11:
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> 
> Changes v2->v3:
>   fix compilation errors on Alpine an CI errors.
> 
> 
> Hannes Reinecke (1):
>   multipathd: replace libreadline with getline()
> 
> Martin Wilck (10):
>   .gitignore: ignore generated ABI files
>   libmultipath: move all reservation key functions to prkey.c
>   libmultipath: always set _GNU_SOURCE
>   multipath-tools: Makefile: fix dependencies for "install" target
>   libmultipath checkers/prioritizers: search for includes in
>     libmultipath
>   libmultipath: remove weak attribute for {get,put}_multipath_config
>   libmultipath: split off libmpathutil
>   multipathc: add new interactive client program
>   multipathd: exec multipathc in interactive mode
>   multipathd: fix incompatible pointer type error with libedit
> 
>  .gitignore                                   |   3 +
>  Makefile                                     |   8 +-
>  Makefile.inc                                 |   5 +-
>  libmpathpersist/Makefile                     |   6 +-
>  libmpathutil/Makefile                        |  70 +++++
>  {libmultipath => libmpathutil}/debug.c       |   0
>  {libmultipath => libmpathutil}/debug.h       |   0
>  libmpathutil/globals.c                       |  12 +
>  libmpathutil/globals.h                       |  39 +++
>  libmpathutil/libmpathutil.version            | 122 +++++++++
>  {libmultipath => libmpathutil}/log.c         |   0
>  {libmultipath => libmpathutil}/log.h         |   0
>  {libmultipath => libmpathutil}/log_pthread.c |   0
>  {libmultipath => libmpathutil}/log_pthread.h |   0
>  {libmultipath => libmpathutil}/parser.c      |   0
>  {libmultipath => libmpathutil}/parser.h      |   2 +-
>  {libmultipath => libmpathutil}/strbuf.c      |   0
>  {libmultipath => libmpathutil}/strbuf.h      |   0
>  {libmultipath => libmpathutil}/time-util.c   |   0
>  {libmultipath => libmpathutil}/time-util.h   |   0
>  {libmultipath => libmpathutil}/util.c        |  32 ---
>  {libmultipath => libmpathutil}/util.h        |   2 -
>  {libmultipath => libmpathutil}/uxsock.c      |   0
>  {libmultipath => libmpathutil}/uxsock.h      |   0
>  {libmultipath => libmpathutil}/vector.c      |   0
>  {libmultipath => libmpathutil}/vector.h      |   0
>  libmpathvalid/Makefile                       |   6 +-
>  libmultipath/Makefile                        |  17 +-
>  libmultipath/checkers/Makefile               |   7 +-
>  libmultipath/checkers/directio.c             |   4 +-
>  libmultipath/checkers/emc_clariion.c         |   2 +-
>  libmultipath/checkers/hp_sw.c                |   4 +-
>  libmultipath/checkers/rdac.c                 |   2 +-
>  libmultipath/checkers/tur.c                  |   8 +-
>  libmultipath/config.c                        |   4 +-
>  libmultipath/config.h                        |  14 +-
>  libmultipath/dict.c                          |  16 +-
>  libmultipath/dict.h                          |   2 -
>  libmultipath/foreign/Makefile                |   6 +-
>  libmultipath/libmultipath.version            |  41 ---
>  libmultipath/prioritizers/Makefile           |   8 +-
>  libmultipath/prioritizers/alua_rtpg.c        |   2 +-
>  libmultipath/prkey.c                         |  49 +++-
>  libmultipath/prkey.h                         |   3 +
>  mpathpersist/Makefile                        |   4 +-
>  multipath/Makefile                           |   6 +-
>  multipathd/Makefile                          |  43 ++-
>  multipathd/cli.c                             | 128 +--------
>  multipathd/cli.h                             |   5 +-
>  multipathd/main.c                            |  15 +-
>  multipathd/multipathc.c                      | 271 +++++++++++++++++++
>  multipathd/uxclnt.c                          | 108 +-------
>  tests/Makefile                               |  12 +-
>  53 files changed, 693 insertions(+), 395 deletions(-)
>  create mode 100644 libmpathutil/Makefile
>  rename {libmultipath => libmpathutil}/debug.c (100%)
>  rename {libmultipath => libmpathutil}/debug.h (100%)
>  create mode 100644 libmpathutil/globals.c
>  create mode 100644 libmpathutil/globals.h
>  create mode 100644 libmpathutil/libmpathutil.version
>  rename {libmultipath => libmpathutil}/log.c (100%)
>  rename {libmultipath => libmpathutil}/log.h (100%)
>  rename {libmultipath => libmpathutil}/log_pthread.c (100%)
>  rename {libmultipath => libmpathutil}/log_pthread.h (100%)
>  rename {libmultipath => libmpathutil}/parser.c (100%)
>  rename {libmultipath => libmpathutil}/parser.h (99%)
>  rename {libmultipath => libmpathutil}/strbuf.c (100%)
>  rename {libmultipath => libmpathutil}/strbuf.h (100%)
>  rename {libmultipath => libmpathutil}/time-util.c (100%)
>  rename {libmultipath => libmpathutil}/time-util.h (100%)
>  rename {libmultipath => libmpathutil}/util.c (92%)
>  rename {libmultipath => libmpathutil}/util.h (96%)
>  rename {libmultipath => libmpathutil}/uxsock.c (100%)
>  rename {libmultipath => libmpathutil}/uxsock.h (100%)
>  rename {libmultipath => libmpathutil}/vector.c (100%)
>  rename {libmultipath => libmpathutil}/vector.h (100%)
>  create mode 100644 multipathd/multipathc.c
> 
> -- 
> 2.37.1
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

