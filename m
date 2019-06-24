Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECCA50487
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 10:26:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 39FCD307D85E;
	Mon, 24 Jun 2019 08:26:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32B511001B29;
	Mon, 24 Jun 2019 08:26:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD34619725;
	Mon, 24 Jun 2019 08:25:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5O8O934007637 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 04:24:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6C88160BFB; Mon, 24 Jun 2019 08:24:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2883960BF7;
	Mon, 24 Jun 2019 08:24:07 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7EB77C01DE89;
	Mon, 24 Jun 2019 08:23:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 3C1CDABD2;
	Mon, 24 Jun 2019 08:23:54 +0000 (UTC)
Message-ID: <3843652fe189d29359442bddcb4c178ad6b319ad.camel@suse.de>
From: Martin Wilck <mwilck@suse.de>
To: Benjamin Marzinski <bmarzins@redhat.com>, mwilck+gmail@suse.de
Date: Mon, 24 Jun 2019 10:23:57 +0200
In-Reply-To: <20190621192307.GL3251@octiron.msp.redhat.com>
References: <20190607130552.13203-1-mwilck@suse.com>
	<20190607130552.13203-8-mwilck@suse.com>
	<20190621192307.GL3251@octiron.msp.redhat.com>
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.32]); Mon, 24 Jun 2019 08:23:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Mon, 24 Jun 2019 08:23:55 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'mwilck@suse.de'
	RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <mwilck@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 07/30] libmpathcmd: use target length in
	strncpy() call
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Mon, 24 Jun 2019 08:26:38 +0000 (UTC)

On Fri, 2019-06-21 at 14:23 -0500, Benjamin Marzinski wrote:
> On Fri, Jun 07, 2019 at 03:05:29PM +0200, Martin Wilck wrote:
> 
> Not a big deal since default socket is a defined string, but since we
> are writing to &addr.sun_path[1], if DEFAULT_SOCKET were of size >=
> "sizeof(addr.sun_path) - 1", the strncpy() would fill all of
> addr.sun_path, without leaving any space for the the null byte at the
> end. I assume you meant to change this to be strlcpy() instead of
> leaving it as strncpy().

I double-checked the man pages unix(7), and I found that abstract unix
socket names do not have to be zero-terminated ("null bytes in the name
have no special significance"). So strncpy() is actually correct in
this case. But the length argument to bind() should be checked.

Thanks,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
