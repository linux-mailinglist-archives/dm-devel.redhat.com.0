Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DC3B1602
	for <lists+dm-devel@lfdr.de>; Thu, 12 Sep 2019 23:47:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E666F83F45;
	Thu, 12 Sep 2019 21:47:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 031125C1B2;
	Thu, 12 Sep 2019 21:47:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11BE84A486;
	Thu, 12 Sep 2019 21:47:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8CLj9sV008828 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 12 Sep 2019 17:45:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BEC2F5DC18; Thu, 12 Sep 2019 21:45:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B85CC5D9E5
	for <dm-devel@redhat.com>; Thu, 12 Sep 2019 21:45:03 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 271103082D9E
	for <dm-devel@redhat.com>; Thu, 12 Sep 2019 21:45:03 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y135so387875wmc.1
	for <dm-devel@redhat.com>; Thu, 12 Sep 2019 14:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=nMNolib+4fHxBePKqSAzZIV5C91kZWzDlg7G0YMSOVs=;
	b=g+bnj5gc2h4Jaibtz6lG8qm+z8lHuqtYsTEbUKmAL+FLferfnfCCymLLQemI9vFPg7
	heXFX373wjFp0kaWrvLlKUReXOxVE/BHBljDdwKVNFRKgIw3idX6JRGUBSc8OkiUqud+
	EYoJ4iNA1guEwtJEVZl9x6qTl3y76qwDjydcWYtoKtZeC+c9VumzP7rI36ueU0kYzm5e
	KsEO6mYx+GPH714T8u45VaioO6ivkWLCF86o7PBtneh2NrouXhm5d2oGYvIVFxhILUSQ
	0kAk/16HiJ0mC+eAhM176kAL1b9EUVEtkiR2uyI8Gt1WX+ImnMBg5UW4CspMG5ZU8V3L
	5NEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=nMNolib+4fHxBePKqSAzZIV5C91kZWzDlg7G0YMSOVs=;
	b=XlGA6GtYWsQI6ZT9SOtiHy3Rquu+Edlp7wNMqkOASsF+yRCPj79cRPkdFFzQaSAgyd
	8DmwTj2VAYGBcNLnXFmrRiGYD1qdMRKS+NnGvLHROCq7MHY2iC3uzTYUcflmNTSZmqEG
	sK3usycUSekmckPySwqnBF+m35Y9wMbJO/Yni5nRnxSTblqoxe0YI/H4yuonrMK75i9g
	lIihpLguIX1m/OA/Ucpq0jO18HnSWkhs3eEssVE4ieU9YlNeyy1II9Bg+A4yifbs7NIz
	78N9skGL+8XgdHob1kcDSIiv1DT63DSxAqd1UlqSzE4LH0n2Xc04NGy4ufCeXhdsQPxa
	hOtA==
X-Gm-Message-State: APjAAAW9ftK534ez/cBHiwxVMnWb95Gu8du+xjs6kQjxrinOCpbgjD9O
	Qpwx5vR03GtRK0vt07joW2aF3vE=
X-Google-Smtp-Source: APXvYqzcg8uxjF7Wb8GuO4zMhRSh/jtUhWUHioIV+BmUcLHrB05JhmeQgnWT+oemQjpba94BOyeZzA==
X-Received: by 2002:a1c:5f0b:: with SMTP id t11mr543350wmb.76.1568324701520;
	Thu, 12 Sep 2019 14:45:01 -0700 (PDT)
Received: from localhost (118.red-88-12-24.staticip.rima-tde.net.
	[88.12.24.118])
	by smtp.gmail.com with ESMTPSA id d12sm450722wme.33.2019.09.12.14.45.00
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 12 Sep 2019 14:45:01 -0700 (PDT)
To: Brian Bunker <brian@purestorage.com>,
	device-mapper development <dm-devel@redhat.com>
References: <EF473529-CF81-4AE9-BD96-08624B59BA10@purestorage.com>
	<ef113ecf-e564-a959-870e-b80af8fe5a30@gmail.com>
	<0A7F7644-C70C-4EEC-B697-AD3B3D8B58DC@purestorage.com>
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
Message-ID: <425666de-ab6c-cf19-c46e-2ef9eae44c91@gmail.com>
Date: Thu, 12 Sep 2019 23:44:59 +0200
MIME-Version: 1.0
In-Reply-To: <0A7F7644-C70C-4EEC-B697-AD3B3D8B58DC@purestorage.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 12 Sep 2019 21:45:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Thu, 12 Sep 2019 21:45:03 +0000 (UTC) for IP:'209.85.128.68'
	DOMAIN:'mail-wm1-f68.google.com' HELO:'mail-wm1-f68.google.com'
	FROM:'xose.vazquez@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.128.68 mail-wm1-f68.google.com 209.85.128.68
	mail-wm1-f68.google.com <xose.vazquez@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] ALUA support for PURE FlashArray
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 12 Sep 2019 21:47:53 +0000 (UTC)

T24gOS8xMi8xOSAzOjUyIEFNLCBCcmlhbiBCdW5rZXIgd3JvdGU6Cgo+IEkgYW0gbm90IHN1cmUg
aWYgdGhlIG1heF9zZWN0b3JzX2tiIGlzIGEga2VybmVsIG9yIHVkZXYgYnVnLiBXaGF0IEkgd291
bGQgZXhwZWN0IGlzIGZvciB0aGUgYmxvY2sgbGltaXRzIAo+IElOUVVJUlkgVlBEICBwYWdlLCAw
eEIwLCB0byBiZSB1c2VkIHRvIHBvcHVsYXRlIHRoZSAvc3lzL2Jsb2NrIGVudHJpZXMgZm9yIG1h
eF9zZWN0b3JzX2tiLiBXZSBoYXZlIAo+IHNlZW4gTGludXggZGlzdHJpYnV0aW9ucyB0aGF0IGRv
buKAmXQgc2VlbSB0byBkbyB0aGF0IGJ1dCBpbnN0ZWFkIHBvcHVsYXRlIHRoYXQgZW50cnkgd2l0
aCAzMiBNQiBldmVuIHRob3VnaCAKCm1hcmdpbmFsIG9yIG1haW4gZGlzdHJpYnV0aW9ucz8KCj4g
d2UgcmV0dXJuIDQgTUIgYXMgb3VyIGxpbWl0LiBXZSBhZGQgdGhlIDQgTUIgbGltaXQgaW4gYSB1
ZGV2IHJ1bGUgdGhhdCB3ZSBoYXZlIGNyZWF0ZWQgYW5kIHByb3ZpZGUgdG8gb3VyIAo+IGN1c3Rv
bWVycy4gIEFkZGluZyBpdCBpbiBtdWx0aXBhdGguY29uZiB3aWxsIGFsc28gZ2V0IHVzIDQgTUIg
Zm9yIHRoZSBkbSBkZXZpY2UgYW5kIGl0cyBzbGF2ZXMgd2hpY2ggaXMgd2hhdCB3ZSAKPiB3YW50
LiBJIGRvbuKAmXQga25vdyBpZiB0aGVyZSBpcyBhIHByZWZlcnJlZCB3YXkgYnV0IGlmIHdlIHVz
ZSBtdWx0aXBhdGguY29uZiB0aGVuIGhvcGVmdWxseSBubyB1c2VycyB3aWxsIGV2ZXIgCj4gaGF2
ZSB0byBkZWFsIHdpdGggdGhlIGhpZ2hlciB2YWx1ZSB0aGF0IHdpbGwgZXJyb3Igb3V0IGlmIGEg
U0NTSSByZWFkIG9yIHdyaXRlIGlzIGFjdHVhbGx5IHNlbnQgbGFyZ2VyIHRoYW4gCj4gdGhlIDQg
TUIgbWF4aW11bSBzaXplLgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhh
dC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs
