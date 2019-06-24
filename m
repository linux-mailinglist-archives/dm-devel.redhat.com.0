Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2473A503F9
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 09:48:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 92E853082208;
	Mon, 24 Jun 2019 07:48:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87EF75B68A;
	Mon, 24 Jun 2019 07:48:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9192A1806B18;
	Mon, 24 Jun 2019 07:48:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5O7lnPG021266 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 03:47:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E65F060A97; Mon, 24 Jun 2019 07:47:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DDEF608E4;
	Mon, 24 Jun 2019 07:47:47 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A3E8E81F31;
	Mon, 24 Jun 2019 07:47:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 2D7D6AEEE;
	Mon, 24 Jun 2019 07:47:29 +0000 (UTC)
Message-ID: <246f3f47b66b928352cda90eea28b19650b37148.camel@suse.de>
From: Martin Wilck <mwilck@suse.de>
To: Benjamin Marzinski <bmarzins@redhat.com>, mwilck+gmail@suse.de
Date: Mon, 24 Jun 2019 09:47:32 +0200
In-Reply-To: <20190621191656.GK3251@octiron.msp.redhat.com>
References: <20190607130552.13203-1-mwilck@suse.com>
	<20190607130552.13203-6-mwilck@suse.com>
	<20190621191656.GK3251@octiron.msp.redhat.com>
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Mon, 24 Jun 2019 07:47:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Mon, 24 Jun 2019 07:47:38 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'mwilck@suse.de'
	RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <mwilck@suse.de>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 05/30] multipath-tools: fix more gcc 9
 -Wstringop-truncation warnings
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Mon, 24 Jun 2019 07:48:47 +0000 (UTC)

On Fri, 2019-06-21 at 14:16 -0500, Benjamin Marzinski wrote:
> On Fri, Jun 07, 2019 at 03:05:27PM +0200, Martin Wilck wrote:
> > More often than not, this means replacing strncpy() by strlcpy().
> 
> This depends on "libmultipath: add size argument to dm_get_uuid()"
> for
> the the extra argument in the call to dm_get_uuid() from
> get_refwwid().
> Otherwise, it looks fine.

Sorry, this mistake slipped in during my attempt to reorder the patch
series into similar-topic groups. I'll fix it and your other issue with
patc 07/30, and resubmit.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
