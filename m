Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4244FA80BD
	for <lists+dm-devel@lfdr.de>; Wed,  4 Sep 2019 13:04:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E2BEA88319;
	Wed,  4 Sep 2019 11:04:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 469F9600CD;
	Wed,  4 Sep 2019 11:04:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11A551800B74;
	Wed,  4 Sep 2019 11:04:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x849hWhd015835 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Sep 2019 05:43:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 46A785D712; Wed,  4 Sep 2019 09:43:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 404745D70D
	for <dm-devel@redhat.com>; Wed,  4 Sep 2019 09:43:28 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
	(eu-smtp-delivery-151.mimecast.com [207.82.80.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 481873082E72
	for <dm-devel@redhat.com>; Wed,  4 Sep 2019 09:43:27 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	uk-mta-2-idzu5r6TOlu_emqmv_fYOA-1; Wed, 04 Sep 2019 10:43:24 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
	AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft
	SMTP Server (TLS) id 15.0.1347.2; Wed, 4 Sep 2019 10:43:23 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
	AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id
	15.00.1347.000; Wed, 4 Sep 2019 10:43:23 +0100
From: David Laight <David.Laight@aculab.com>
To: "'Alexey Dobriyan'" <adobriyan@gmail.com>, Valentin Schneider
	<valentin.schneider@arm.com>
Thread-Topic: [PATCH] sched: make struct task_struct::state 32-bit
Thread-Index: AQHVYoQgiajii1HT8kenaFCmXyiHJqcbRQQA
Date: Wed, 4 Sep 2019 09:43:23 +0000
Message-ID: <651c419e45e043e9be8d0877b5a5406d@AcuMS.aculab.com>
References: <20190902210558.GA23013@avx2>
	<d8ad0be1-4ed7-df74-d415-2b1c9a44bac7@arm.com>
	<20190903181920.GA22358@avx2>
In-Reply-To: <20190903181920.GA22358@avx2>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: idzu5r6TOlu_emqmv_fYOA-1
X-Mimecast-Spam-Score: 0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Wed, 04 Sep 2019 09:43:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Wed, 04 Sep 2019 09:43:27 +0000 (UTC) for IP:'207.82.80.151'
	DOMAIN:'eu-smtp-delivery-151.mimecast.com'
	HELO:'eu-smtp-delivery-151.mimecast.com'
	FROM:'david.laight@aculab.com' RCPT:''
X-RedHat-Spam-Score: -0.7  (RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 207.82.80.151 eu-smtp-delivery-151.mimecast.com
	207.82.80.151 eu-smtp-delivery-151.mimecast.com
	<david.laight@aculab.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x849hWhd015835
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 04 Sep 2019 07:04:28 -0400
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"aarcange@redhat.com" <aarcange@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rcu@vger.kernel.org" <rcu@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mingo@redhat.com" <mingo@redhat.com>
Subject: Re: [dm-devel] [PATCH] sched: make struct task_struct::state 32-bit
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Wed, 04 Sep 2019 11:04:37 +0000 (UTC)

From: Alexey Dobriyan
> Sent: 03 September 2019 19:19
...
> > How did you come up with this changeset, did you pickaxe for some regexp?
> 
> No, manually, backtracking up to the call chain.
> Maybe I missed a few places.

Renaming the structure field and getting the compiler to find all the uses can help.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
