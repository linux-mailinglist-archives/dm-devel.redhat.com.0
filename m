Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E11F6C015
	for <lists+dm-devel@lfdr.de>; Wed, 17 Jul 2019 19:10:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F3DD13092651;
	Wed, 17 Jul 2019 17:10:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B2E75D71D;
	Wed, 17 Jul 2019 17:10:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 24A2F41F53;
	Wed, 17 Jul 2019 17:09:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6HH9eG8024917 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jul 2019 13:09:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 479FA19C78; Wed, 17 Jul 2019 17:09:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E60719C59
	for <dm-devel@redhat.com>; Wed, 17 Jul 2019 17:09:37 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr50058.outbound.protection.outlook.com [40.107.5.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5741681DE0
	for <dm-devel@redhat.com>; Wed, 17 Jul 2019 17:09:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=bQMdXWw1GO6dyHvLYGwtzQ1gbB4whTMBLyO3D9virFchK2XK0nyJw6emlLPWL4IXxTfAHpD+SugZ3HpK4x4qyrR8ZP1A0wT2in1I2PlH6hqPivnpimkKRbjG44aEN57/7UmTLQJXXelk8g59erOq43RjVg/k4bAJzBpucgM2Ri+XwM0fH86rPy/jhDWhCdrPDF4O+AabVCaWqnRD7yt4QNvv+sUbLPPA26cHLzGcFQyRl+jtGRN7Ha4nVJQRMt4JS8kP4UkOeP+akm4hAW2YEbkPfTR46jNoQ0sdWwdu3Vv4beWJeO+Acf0J7rGqHY+ystsMfyEbPPnSPISA08a3Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ix3UNW44+NwDPC7zfZuJSGL8iwk/ApLNIibzrnJNApg=;
	b=D+Ojbmjp/JErD0FUe8FI4VPaGaVy4RAvS2ISNyaytVpbWHpCGVCPQ5X9KzOWC4yjn9+Y0qmrQ8nSD6i3ABP79zRmCFU+31s9p2dNIUMGv5dmaBNgXTMHf5z6kTuJCygrq96vzGAzqWmPHf8+16mC5IuGJVg1UsQNqwNAIKnhxLnbaPMzzuvb7Y2Yjx9UdQ18hi/gWy2fFZOuj3I9PtXd0OdmukRUehthl5le+kbgZkYrT2OFMCp/tn4j0qh8ZHTBBhEfQaS9nFa0GkeA/SFWlS8cCjDmdtIbIEy5zeX8Rp3rQM5HZsVbRm6jZ4FsD9+NTEtQmLBye/5GL0uSjginfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com;
	dkim=pass header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ix3UNW44+NwDPC7zfZuJSGL8iwk/ApLNIibzrnJNApg=;
	b=lvVWTqSgDc5kJmt90FWKNS47/WeyNqsmC+8iNJg8pdLLgQtmE2V/q2bnUiPnztE/O3HxZUL8ZkD7F+wg5RAfIB9OJiKtlh6qO9yhT88fGNQGe/xARjRMNCTwoy+5GpOvpHAC74Ga5N4ngK54GqIxGBJSneoM6RCSKVzuzv5IPNc=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
	VI1PR0402MB3920.eurprd04.prod.outlook.com (52.134.17.140) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2073.14; Wed, 17 Jul 2019 17:09:31 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
	([fe80::7c64:5296:4607:e10]) by
	VI1PR0402MB3485.eurprd04.prod.outlook.com
	([fe80::7c64:5296:4607:e10%5]) with mapi id 15.20.2073.012;
	Wed, 17 Jul 2019 17:09:31 +0000
From: Horia Geanta <horia.geanta@nxp.com>
To: Eric Biggers <ebiggers@kernel.org>
Thread-Topic: xts fuzz testing and lack of ciphertext stealing support
Thread-Index: AQHVO/5l0aVU4O6KC0WgPIqEsMQCDg==
Date: Wed, 17 Jul 2019 17:09:31 +0000
Message-ID: <VI1PR0402MB34857BBB18C2BB8CBA2DEC7198C90@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <VI1PR0402MB34858E4EF0ACA7CDB446FF5798CE0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190716221639.GA44406@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 279d63aa-25f1-468d-e6d8-08d70ad988d7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:VI1PR0402MB3920; 
x-ms-traffictypediagnostic: VI1PR0402MB3920:
x-microsoft-antispam-prvs: <VI1PR0402MB3920223A53ACBAC4FDA2286698C90@VI1PR0402MB3920.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(979002)(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(199004)(189003)(5660300002)(52536014)(6116002)(66066001)(33656002)(3846002)(256004)(14444005)(4326008)(6436002)(76176011)(66946007)(55016002)(186003)(26005)(229853002)(6246003)(6916009)(53936002)(7696005)(6506007)(53546011)(14454004)(44832011)(305945005)(71190400001)(486006)(99286004)(2906002)(71200400001)(74316002)(25786009)(102836004)(476003)(81156014)(81166006)(76116006)(54906003)(8676002)(316002)(68736007)(66476007)(91956017)(66446008)(64756008)(66556008)(478600001)(8936002)(446003)(86362001)(9686003)(7736002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3920;
	H:VI1PR0402MB3485.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wbCEFnwbkDX9YS5qCWD9PwmIL98FxXKYPQSg0QP9p44aFFfODyp6uZaiiewSvKdZZ1DgEKOiJbXWbQM+kqk4RAZ5V72TKW0rsRludtrrIf5cJFHRyNoH4xL/mV452PAqUQ5lqZLycZo9Lx8JaBMV8QcQ2IbPDWnJ1hCI9Bv4hoY+V2zRULzTZdE84dVBKwjWehocXQb3gFBeGwbegUrKW13WfiyWU1adT+ZDv38IAo0EB6/Zb9/Fm84hLV9HkwDQhF7UO1IRFR0gn4N9NK8kfXA3ZtRCa1mFP/HarUK3Ami77i6Q/czDWHSOnc2QsCzHoGE3DmuCij2F5mkyRYP1o1SxIhPloKuUbHU/n5nxrBIhzvpAIWS3YZGT+0noitUgnei2/qjG9W+o2jCE4lNYTnOXqN/j9s6FgWlVH23A414=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 279d63aa-25f1-468d-e6d8-08d70ad988d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 17:09:31.5296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: horia.geanta@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3920
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Wed, 17 Jul 2019 17:09:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Wed, 17 Jul 2019 17:09:37 +0000 (UTC) for IP:'40.107.5.58'
	DOMAIN:'mail-eopbgr50058.outbound.protection.outlook.com'
	HELO:'EUR03-VE1-obe.outbound.protection.outlook.com'
	FROM:'horia.geanta@nxp.com' RCPT:''
X-RedHat-Spam-Score: -0.102  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_PASS,
	SPF_PASS) 40.107.5.58 mail-eopbgr50058.outbound.protection.outlook.com
	40.107.5.58 mail-eopbgr50058.outbound.protection.outlook.com
	<horia.geanta@nxp.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6HH9eG8024917
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Wed, 17 Jul 2019 17:10:05 +0000 (UTC)

On 7/17/2019 1:16 AM, Eric Biggers wrote:
> Hi Horia,
> 
> On Tue, Jul 16, 2019 at 05:46:29PM +0000, Horia Geanta wrote:
>> Hi,
>>
>> With fuzz testing enabled, I am seeing xts(aes) failures on caam drivers.
>>
>> Below are several failures, extracted from different runs:
>>
>> [    3.921654] alg: skcipher: xts-aes-caam encryption unexpectedly succeeded on test vector "random: len=40 klen=64"; expected_error=-22, cfg="random: inplace use_finup nosimd src_divs=[57.93%@+11, 37.18%@+164, <reimport>0.68%@+4, 0.50%@+305, 3.71%@alignmask+3975]" 
>>
>> [    3.726698] alg: skcipher: xts-aes-caam encryption unexpectedly succeeded on test vector "random: len=369 klen=64"; expected_error=-22, cfg="random: inplace may_sleep use_digest src_divs=[100.0%@alignmask+584]" 
>>
>> [    3.741082] alg: skcipher: xts-aes-caam encryption unexpectedly succeeded on test vector "random: len=2801 klen=64"; expected_error=-22, cfg="random: inplace may_sleep use_digest src_divs=[100.0%@+6] iv_offset=18"
>>
>> It looks like the problem is not in CAAM driver.
>> More exactly, fuzz testing is generating random test vectors and running
>> them through both SW generic (crypto/xts.c) and CAAM implementation:
>> -SW generic implementation of xts(aes) does not support ciphertext stealing
>> and throws -EINVAL when input is not a multiple of AES block size (16B)
>> -caam has support for ciphertext stealing, and allows for any input size
>> which results in "unexpectedly succeeded" error messages.
>>
>> Any suggestion how this should be fixed?
>>
>> Thanks,
>> Horia
> 
> I don't think drivers should allow inputs the generic implementation doesn't,
> since those inputs aren't tested by the crypto self-tests (so how do you know
How about implementation adding static test vectors and using them to validate
the standard feature set that's not supported by the generic implementation?

> it's even correct?), and people could accidentally rely on the driver-specific
> behavior and then be unable to migrate to another platform or implementation.
> 
People could also *intentionally* rely on a driver offering an implementation
that is closer to the spec / standard.

> So for now I recommend just updating the caam driver to return -EINVAL on XTS
> inputs not evenly divisible by the block size.
> 
I was hoping for something more constructive...

> Of course, if there are actual use cases for XTS with ciphertext stealing in the
> kernel, we could add it to all the other implementations too.  But I'm not aware
> of any currently.  Don't all XTS users in the kernel pass whole blocks?
> 
That's my guess too.

What about user space relying on offloading and xts working
according to the spec?

Thanks,
Horia

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
