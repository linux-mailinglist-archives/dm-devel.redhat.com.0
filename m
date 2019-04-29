Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A70F3E578
	for <lists+dm-devel@lfdr.de>; Mon, 29 Apr 2019 16:53:37 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C15BC3084266;
	Mon, 29 Apr 2019 14:53:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D11C06CE47;
	Mon, 29 Apr 2019 14:53:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6899041F3C;
	Mon, 29 Apr 2019 14:53:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3TEqUJZ017122 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Apr 2019 10:52:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2D4A86928F; Mon, 29 Apr 2019 14:52:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28D995C239
	for <dm-devel@redhat.com>; Mon, 29 Apr 2019 14:52:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25BFB9D416
	for <dm-devel@redhat.com>; Mon, 29 Apr 2019 14:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209;
	h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XWObNu9Ml1qqZhYpuzXFaJYSLMbGpHRtVg/+qSsyk7A=;
	b=fbOBs4n+O0FSpPNZiT9SIFm0GN
	eP7WrfkWbUH0ros5nKaEqn+4p5WRJAaXK7RK2vOyYWz1n55wltI3RexAFvTQZ/lO1+aCAKFo9oF+i
	sPJKZa8YIfBVB79Izp+3105hbKbPwvfQhHebiTGG+BePIlGlt+MfOPdhNtYh/4vD5yHn5KM6eHREC
	N9pB+ppuvDdjMOz22khgjLEwBlD9MWwXsDFBNR350F/YViOxVI8+wbmEqKSTOqQhLFBaiJMQDSjUa
	IO+i3lJ/157z1/e4Klivg1sZxg0QJFG5tuFse94DELxwJu0XwOebx84WwWrhzHf107PWFYG9W2C+8
	Z4BkmTZA==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
	helo=midway.dunlab)
	by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL7dS-0000V6-RY; Mon, 29 Apr 2019 14:52:03 +0000
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20190429190354.0d5e2e93@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <534f901f-c662-6216-c39a-addb545f614b@infradead.org>
Date: Mon, 29 Apr 2019 07:52:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429190354.0d5e2e93@canb.auug.org.au>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Mon, 29 Apr 2019 14:52:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Mon, 29 Apr 2019 14:52:18 +0000 (UTC) for IP:'205.233.59.134'
	DOMAIN:'merlin.infradead.org' HELO:'merlin.infradead.org'
	FROM:'rdunlap@infradead.org' RCPT:''
X-RedHat-Spam-Score: -2.4  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED) 205.233.59.134 merlin.infradead.org
	205.233.59.134 merlin.infradead.org <rdunlap@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel <dm-devel@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [dm-devel] linux-next: Tree for Apr 29 (drivers/md/dm-dust)
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Mon, 29 Apr 2019 14:53:36 +0000 (UTC)

On 4/29/19 2:03 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190426:
> 

on i386:

ld: drivers/md/dm-dust.o: in function `dust_map':
dm-dust.c:(.text+0x28d): undefined reference to `__udivdi3'
ld: drivers/md/dm-dust.o: in function `dust_message':
dm-dust.c:(.text+0x9a4): undefined reference to `__udivdi3'



-- 
~Randy

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
