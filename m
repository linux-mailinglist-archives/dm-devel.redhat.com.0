Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D200E519E9B
	for <lists+dm-devel@lfdr.de>; Wed,  4 May 2022 13:54:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651665267;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IXFZBK3mLI1UG8mEYHC5BWr/vJZUrr6+q/jrN944H5E=;
	b=CFfd7IuKe0ZygS0IDKO43GSBi65+WLiWWlov68S/3gJPb/9XIBhbbkRCIPn+ry6aBjlQwC
	wPO7EdesU49H1EU9nUpPhMN9ilhtPwHgvPFi+9tXyVHFU824wf5M2qMHUSeCAzz+rSoMX+
	EZvD+w9VHzzRklUEIBMgQH7fGpipjV4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-57n-_Q9qOSGPXofT1s77GQ-1; Wed, 04 May 2022 07:54:24 -0400
X-MC-Unique: 57n-_Q9qOSGPXofT1s77GQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1AC686B8AB;
	Wed,  4 May 2022 11:54:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 797402D441;
	Wed,  4 May 2022 11:54:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3A3551947053;
	Wed,  4 May 2022 11:54:16 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6227F1947040
 for <dm-devel@listman.corp.redhat.com>; Wed,  4 May 2022 11:54:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 09B8F400F736; Wed,  4 May 2022 11:54:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D57CB40CF8F8;
 Wed,  4 May 2022 11:54:14 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 244BsEPg020594; Wed, 4 May 2022 07:54:14 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 244BsEjr020590; Wed, 4 May 2022 07:54:14 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Wed, 4 May 2022 07:54:14 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Andy Shevchenko <andriy.shevchenko@intel.com>
In-Reply-To: <YnJFViBFIgYOl7/2@smile.fi.intel.com>
Message-ID: <alpine.LRH.2.02.2205040752210.20320@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2204241648270.17244@file01.intranet.prod.int.rdu2.redhat.com>
 <CAHk-=wh+Z+OKH3jRttWGHbWSQq2wVMtdnA=ntDiadZu=VxAC7w@mail.gmail.com>
 <alpine.LRH.2.02.2204250723120.26714@file01.intranet.prod.int.rdu2.redhat.com>
 <YnI7hE4cIfjsdKSF@antec>
 <alpine.LRH.2.02.2205040453050.22937@file01.intranet.prod.int.rdu2.redhat.com>
 <YnJFViBFIgYOl7/2@smile.fi.intel.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [dm-devel] [PATCH v2] hex2bin: make the function hex_to_bin
 constant-time
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
Cc: Andy Shevchenko <andy@kernel.org>, Mike Snitzer <msnitzer@redhat.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Milan Broz <gmazyland@gmail.com>,
 device-mapper development <dm-devel@redhat.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Jason@zx2c4.com,
 Stafford Horne <shorne@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Wed, 4 May 2022, Andy Shevchenko wrote:

> On Wed, May 04, 2022 at 04:57:35AM -0400, Mikulas Patocka wrote:
> > On Wed, 4 May 2022, Stafford Horne wrote:
> > > On Mon, Apr 25, 2022 at 08:07:48AM -0400, Mikulas Patocka wrote:
> 
> ...
> 
> > > Just a heads up it seems this patch is causing some instability with crypto self
> > > tests on OpenRISC when using a PREEMPT kernel (no SMP).
> > > 
> > > This was reported by Jason A. Donenfeld as it came up in wireguard testing.
> > > 
> > > I am trying to figure out if this is an OpenRISC PREEMPT issue or something
> > > else.
> 
> > That patch is so simple that I can't imagine how could it break the 
> > curve25519 test. Are you sure that you bisected it correctly?
> 
> Can you provide a test cases for hex_to_bin()?

I tested it with this:

#include <stdio.h>

int hex_to_bin(unsigned char c);

int main(void)
{
        int i;
        for (i = 0; i < 256; i++)
                printf("%02x - %d\n", i, hex_to_bin(i));
        return 0;
}

Mikulas
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

