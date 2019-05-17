Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7227C21FFA
	for <lists+dm-devel@lfdr.de>; Fri, 17 May 2019 23:58:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2200E2DD43;
	Fri, 17 May 2019 21:58:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB34460BE0;
	Fri, 17 May 2019 21:58:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4E2D9206D2;
	Fri, 17 May 2019 21:58:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4HLuwBY022710 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 May 2019 17:56:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8D73F61358; Fri, 17 May 2019 21:56:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 533F259D0A;
	Fri, 17 May 2019 21:56:56 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F5C330A00E5;
	Fri, 17 May 2019 21:56:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 28079AE33;
	Fri, 17 May 2019 21:56:46 +0000 (UTC)
Message-ID: <2e9ce7711685308366025c55b34abb565034e202.camel@suse.de>
From: Martin Wilck <mwilck@suse.de>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Fri, 17 May 2019 23:56:45 +0200
In-Reply-To: <1558109650-21179-1-git-send-email-bmarzins@redhat.com>
References: <1558109650-21179-1-git-send-email-bmarzins@redhat.com>
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Fri, 17 May 2019 21:56:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Fri, 17 May 2019 21:56:47 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'mwilck@suse.de'
	RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <mwilck@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/4] Coverity fixes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Fri, 17 May 2019 21:58:18 +0000 (UTC)

On Fri, 2019-05-17 at 11:14 -0500, Benjamin Marzinski wrote:
> These are fixes to some issues that coverity pointed out.
> 
> Benjamin Marzinski (4):
>   libmultipath: handle clock_gettime failures in tur checker
>   kpartx: fail if dup() of dasd file descriptor fails
>   multipathd: fix REALLOC_REPLY with max length reply
>   multipathd: handle NULL return from genhelp_handler
> 
>  kpartx/dasd.c               |  2 ++
>  libmultipath/checkers/tur.c | 19 +++++++++++++++----
>  multipathd/cli.c            |  6 +++++-
>  multipathd/cli.h            | 17 +++++++++--------
>  4 files changed, 31 insertions(+), 13 deletions(-)
> 

ACK for the series, except 1/4.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
