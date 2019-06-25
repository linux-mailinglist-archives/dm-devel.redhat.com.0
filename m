Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA81553CE
	for <lists+dm-devel@lfdr.de>; Tue, 25 Jun 2019 17:57:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2E6013082E8E;
	Tue, 25 Jun 2019 15:57:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D7C55C22F;
	Tue, 25 Jun 2019 15:57:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE654206D2;
	Tue, 25 Jun 2019 15:56:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5PFuDfP028304 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 11:56:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4FE245D9E1; Tue, 25 Jun 2019 15:56:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CADF25D9C5;
	Tue, 25 Jun 2019 15:56:08 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D6C4430872C7;
	Tue, 25 Jun 2019 15:55:59 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id e5so9054864pls.13;
	Tue, 25 Jun 2019 08:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=X8PyZ6mm09HvpAjBsN2bzxK8nd8cfLA+VCOhqGU8yjE=;
	b=THXT5qhWP3e3CTSEMUBbFukUIdZmmT/wTnVcXyNNmUE+AGMaAR0SOPxehvxBUEl2XV
	cGMTbvU8B3EdER7QzNRhECJALDM5JxrUAapbXIv0sWpiM5hG/GdtvqiHjsVsldl5+VXG
	XuMZ3hMA+b+5OJ7tYKT7YWpvgZZq1cU3O7qELfaaqCisGNYucSyEM5ohiCJc1MmMF7Ca
	Vo9B1mTglB5zz//rSvBhj26wWHMRoj30gNrE9R1s9FIHuTAZb1eWJYC5hSGpJcr1rDCr
	wIS2RR5BUAFDCEBra2euHtY/zNGoZNMDBy0vj2AhpT91pOgLU//23au15D+0E2mAB/PU
	9smg==
X-Gm-Message-State: APjAAAWPPh1r3iXqkVrx9SiRuBDIIr8I2k1cqbEY05l9TUL23wO2oByF
	jOcrDag55V9qAf0j2HELAPI=
X-Google-Smtp-Source: APXvYqzqnMz19/tkZ2lWR1LALGAy9toe5Xj906/48mLtj3J82ryMK3ntCRQMy81JplrGUfNQYwrwTg==
X-Received: by 2002:a17:902:8203:: with SMTP id
	x3mr72155467pln.304.1561478159207; 
	Tue, 25 Jun 2019 08:55:59 -0700 (PDT)
Received: from desktop-bart.svl.corp.google.com
	([2620:15c:2cd:202:4308:52a3:24b6:2c60])
	by smtp.gmail.com with ESMTPSA id
	5sm14545676pfh.109.2019.06.25.08.55.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jun 2019 08:55:58 -0700 (PDT)
To: =?UTF-8?Q?Matias_Bj=c3=b8rling?= <mb@lightnvm.io>,
	Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>, "axboe@fb.com"
	<axboe@fb.com>, "hch@lst.de" <hch@lst.de>,
	Damien Le Moal <Damien.LeMoal@wdc.com>,
	Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Ajay Joshi <Ajay.Joshi@wdc.com>,
	Aravind Ramesh <Aravind.Ramesh@wdc.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "agk@redhat.com" <agk@redhat.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>
References: <20190621130711.21986-1-mb@lightnvm.io>
	<20190621130711.21986-2-mb@lightnvm.io>
	<ee5764fb-473a-f118-eaac-95478d885f6f@acm.org>
	<BYAPR04MB5749CEFBB45EA34BD3345CD686E00@BYAPR04MB5749.namprd04.prod.outlook.com>
	<cce08df0-0b4d-833d-64ce-f9b81f7ad7ca@lightnvm.io>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <79ca395d-8019-9ec8-0c0b-194ca6d9eda0@acm.org>
Date: Tue, 25 Jun 2019 08:55:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <cce08df0-0b4d-833d-64ce-f9b81f7ad7ca@lightnvm.io>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Tue, 25 Jun 2019 15:55:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Tue, 25 Jun 2019 15:55:59 +0000 (UTC) for IP:'209.85.214.196'
	DOMAIN:'mail-pl1-f196.google.com'
	HELO:'mail-pl1-f196.google.com' FROM:'bart.vanassche@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.492  (FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.214.196 mail-pl1-f196.google.com 209.85.214.196
	mail-pl1-f196.google.com <bart.vanassche@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	Matias Bjorling <Matias.Bjorling@wdc.com>
Subject: Re: [dm-devel] [PATCH 1/4] block: add zone open,
	close and finish support
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 25 Jun 2019 15:57:45 +0000 (UTC)

T24gNi8yNS8xOSAzOjM1IEFNLCBNYXRpYXMgQmrDuHJsaW5nIHdyb3RlOgo+IE9uIDYvMjUvMTkg
MTI6MjcgQU0sIENoYWl0YW55YSBLdWxrYXJuaSB3cm90ZToKPj4gT24gNi8yNC8xOSAxMjo0MyBQ
TSwgQmFydCBWYW4gQXNzY2hlIHdyb3RlOgo+Pj4gc3RhdGljIGlubGluZSBib29sIG9wX2lzX3dy
aXRlKHVuc2lnbmVkIGludCBvcCkKPj4+IHsKPj4+IMKgwqDCoMKgcmV0dXJuIChvcCAmIDEpOwo+
Pj4gfQo+Pj4KPj4KPiAKPiBUaGUgem9uZSBtZ210IGNvbW1hbmRzIGFyZSBuZWl0aGVyIHdyaXRl
IG5vciByZWFkcyBjb21tYW5kcy4gSSBndWVzcywgCj4gb25lIGNvdWxkIGNoYXJhY3Rlcml6ZSB0
aGVtIGFzIHdyaXRlIGNvbW1hbmRzLCBidXQgdGhleSBkb24ndCB3cml0ZSBhbnkgCj4gZGF0YSwg
dGhleSB1cGRhdGUgYSBzdGF0ZSBvZiBhIHpvbmUgb24gYSBkcml2ZS4gT25lIHNob3VsZCBrZWVw
IGl0IGFzIAo+IGlzPyBhbmQgbWFrZSBzdXJlIHRoZSB6b25lIG1nbXQgY29tbWFuZHMgZG9uJ3Qg
Z2V0IGNhdGVnb3JpemVkIGFzIGVpdGhlciAKPiByZWFkL3dyaXRlLgoKU2luY2UgdGhlIG9wZW4s
IGNsb3NlIGFuZCBmaW5pc2ggb3BlcmF0aW9ucyBzdXBwb3J0IG1vZGlmeWluZyB6b25lIGRhdGEg
CkkgcHJvcG9zZSB0byBjaGFyYWN0ZXJpemUgdGhlc2UgYXMgd3JpdGUgY29tbWFuZHMuIEhvdyBh
Ym91dCB0aGUgCmZvbGxvd2luZyBhZGRpdGlvbmFsIGNoYW5nZXM6Ci0gTWFrZSBiaW9fY2hlY2tf
cm8oKSByZWZ1c2Ugb3Blbi9jbG9zZS9mbHVzaC9yZXNldCB6b25lIG9wZXJhdGlvbnMgZm9yIApy
ZWFkLW9ubHkgcGFydGl0aW9ucyAoc2VlIGFsc28gY29tbWl0IGEzMmUyMzZlYjkzZSAoIlBhcnRp
YWxseSByZXZlcnQgCiJibG9jazogZmFpbCBvcF9pc193cml0ZSgpIHJlcXVlc3RzIHRvIHJlYWQt
b25seSBwYXJ0aXRpb25zIiIpICMgdjQuMTgpLgotIEluIHN1Ym1pdF9iaW8oKSwgY2hhbmdlIG9w
X2lzX3dyaXRlKGJpb19vcChiaW8pKSA/ICJXUklURSIgOiAiUkVBRCIgCmludG8gc29tZXRoaW5n
IHRoYXQgdXNlcyBibGtfb3Bfc3RyKCkuCi0gQWRkIG9wZW4vY2xvc2UvZmx1c2ggem9uZSBzdXBw
b3J0IGJlIGFkZGVkIGluIGJsa19wYXJ0aXRpb25fcmVtYXAoKS4KClRoYW5rcywKCkJhcnQuCgot
LQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5y
ZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=
