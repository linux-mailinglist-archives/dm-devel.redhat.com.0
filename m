Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8806EF03
	for <lists+dm-devel@lfdr.de>; Sat, 20 Jul 2019 12:20:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 77A5F83F40;
	Sat, 20 Jul 2019 10:20:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1875317F88;
	Sat, 20 Jul 2019 10:20:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D0DA34EA31;
	Sat, 20 Jul 2019 10:20:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6KAK5Os016643 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 20 Jul 2019 06:20:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 81E3F10246F0; Sat, 20 Jul 2019 10:20:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BF581019607
	for <dm-devel@redhat.com>; Sat, 20 Jul 2019 10:20:03 +0000 (UTC)
Received: from sophos.c3bo.org (sophos.c3bo.org [77.109.150.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B0282A13E4
	for <dm-devel@redhat.com>; Sat, 20 Jul 2019 10:20:01 +0000 (UTC)
Received: from mx1.c3bo.org ([172.31.0.4]:40940)
	by sophos.c3bo.org with esmtps (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
	(Exim 4.82_1-5b7a7c0-XX)
	(envelope-from <markus@eserver.homelinux.org>) id 1homN9-0002rd-2r
	for dm-devel@redhat.com; Sat, 20 Jul 2019 12:13:54 +0200
Received: from eserver.homelinux.org (eserver.homelinux.org [192.168.0.1])
	by mx1.c3bo.org (Postfix) with ESMTPS id 10C6F153A80
	for <dm-devel@redhat.com>; Sat, 20 Jul 2019 12:13:46 +0200 (CEST)
Received: from [192.168.178.26] (i53875118.versanet.de [83.135.81.24])
	by eserver.homelinux.org (Postfix) with ESMTPSA id 97ACD500099
	for <dm-devel@redhat.com>; Sat, 20 Jul 2019 12:13:45 +0200 (CEST)
X-CTCH-RefID: str=0001.0A0C0201.5D32E962.0044, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
To: dm-devel@redhat.com
References: <20190716221639.GA44406@gmail.com>
	<VI1PR0402MB34857BBB18C2BB8CBA2DEC7198C90@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190717172823.GA205944@gmail.com>
	<CAKv+Gu__offPaWvyURJr8v56ig58q-Deo16QhP26EJ32uf5m3w@mail.gmail.com>
	<20190718065223.4xaefcwjoxvujntw@gondor.apana.org.au>
	<CAKv+Gu9-EWNpJ9viSsjhYRdOZb=7a=Mpddmyt8SLEq9aFtawjg@mail.gmail.com>
	<20190718072154.m2umem24x4grbf6w@gondor.apana.org.au>
	<36e78459-1594-6d19-0ab4-95b03a6de036@gmail.com>
	<MN2PR20MB2973E61815F069E8C7D74177CAC80@MN2PR20MB2973.namprd20.prod.outlook.com>
	<b042649c-db98-9710-b063-242bdf520252@gmail.com>
	<20190720065807.GA711@sol.localdomain>
	<0d4d6387-777c-bfd3-e54a-e7244fde0096@gmail.com>
From: Markus <markus@eserver.homelinux.org>
Openpgp: preference=signencrypt
Autocrypt: addr=markus@eserver.homelinux.org; prefer-encrypt=mutual; keydata=
	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
	wmw23DJtYT857g==
Message-ID: <b73ecfd1-adaf-e4de-83ba-a6eeaae629df@eserver.homelinux.org>
Date: Sat, 20 Jul 2019 12:13:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <0d4d6387-777c-bfd3-e54a-e7244fde0096@gmail.com>
Content-Language: de-DE
X-Greylist: Delayed for 00:05:58 by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.26]); Sat, 20 Jul 2019 10:20:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Sat, 20 Jul 2019 10:20:02 +0000 (UTC) for IP:'77.109.150.68'
	DOMAIN:'sophos.c3bo.org' HELO:'sophos.c3bo.org'
	FROM:'markus@eserver.homelinux.org' RCPT:''
X-RedHat-Spam-Score: 0.002  (SPF_HELO_NONE,
	SPF_NONE) 77.109.150.68 sophos.c3bo.org 77.109.150.68
	sophos.c3bo.org <markus@eserver.homelinux.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] xts fuzz testing and lack of ciphertext stealing
 support
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Sat, 20 Jul 2019 10:20:38 +0000 (UTC)

Thanks for tellimg me as a user :-)
... learned something :-)

Am 20.07.19 um 09:35 schrieb Milan Broz:
> 
> If it is visible to users, it needs some work in userspace - XEX (as XTS) need two keys,
> people are already confused enough that 256bit key in AES-XTS means AES-128...
> So the examples, hints, man pages need to be updated, at least.
> 
> Milan
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
