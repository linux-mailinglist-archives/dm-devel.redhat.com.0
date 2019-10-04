Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C5BCC689
	for <lists+dm-devel@lfdr.de>; Sat,  5 Oct 2019 01:30:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8091EC057E9A;
	Fri,  4 Oct 2019 23:30:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 718815C1B5;
	Fri,  4 Oct 2019 23:30:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A25EA4A486;
	Fri,  4 Oct 2019 23:30:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x94NUCEh020915 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Oct 2019 19:30:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8926310018FF; Fri,  4 Oct 2019 23:30:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82BC010018F8
	for <dm-devel@redhat.com>; Fri,  4 Oct 2019 23:30:09 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0F9C38372E9
	for <dm-devel@redhat.com>; Fri,  4 Oct 2019 23:30:09 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p14so8041844wro.4
	for <dm-devel@redhat.com>; Fri, 04 Oct 2019 16:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:from:to:references:message-id:date:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=CIsBzjkanL1a646kjl/Vdxu5lNimzDt1tYL9BkFfRkY=;
	b=TUNKsMEG/ILYHB0tx0+Eh/G7wYkk/nr6lHktvK19x/2jjvo8vo4lIeUTQgiHDE1CPH
	3TlskOnAKQtXyF34EQcH8HjCVWfQC36HQ/WS7N+zXaV8Gh/1Ca9jK2CaOyiDp4CVc0s/
	wGcpVAathG4HXsKDlZxocPlFJpu7iKq4msSDbPVibWsclN2D7j0FR5c6ZGwA8T8CHqMo
	YkRTA68kw5xw59AF2Ipt/GtI3ub+vJsJvzv+7Hywe9ZU6yOU1G0Lh+0AkRGKeJxKkONp
	Sbwb3seBTHQj960VYwU1ER1J/F9jLJArkZwuILx0FpSenRF/DTRxl6eOwYopfOHHuFHQ
	dKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:references:message-id:date
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=CIsBzjkanL1a646kjl/Vdxu5lNimzDt1tYL9BkFfRkY=;
	b=klnsOxkCrKIBGR3DUobDc1Ciwg5TLOnvFnIljBn/ILSxGc53B/GiskSUh0Y8KqxCge
	gLJN5P/wzkpuF6dtNH0fL260ADgJJN+zKgffozyTcdYctoIJUk+jkac8kInETdnBNGqy
	ov/S86z3rKPaBnHOibQO6XJA4ULkWdsTBgmUO9OPex8bsdPcsSns036bk940HvQv7ve/
	BiX/YClN8X7XoaDoEMjXRyE8Z0V5JWn+wZOivu4kXjyjHZ3D/SimCs/Fqg0bemnbBW85
	L8M4auDV/6YVFwtH0C1H2n1URJNFK7S7nhyGrrmXLVRvP7FN7E4H4MIPpfR/x6WzAkdw
	diHQ==
X-Gm-Message-State: APjAAAVX+8Nzt8kVgbnseAWWfAcRQYVc9fzymykTYuEeEa6dEDLdrRV/
	Rv5rIoxPIMzzGR/kP5rrPqMsNEs=
X-Google-Smtp-Source: APXvYqzhTLjnaz6HXI8AvzJWFxewT1cbnQDOz8mwrqtWbDQdPZYOzqj3DkRrKxpg6+Puyh8o+T9bGw==
X-Received: by 2002:adf:eb42:: with SMTP id u2mr13385815wrn.307.1570231807336; 
	Fri, 04 Oct 2019 16:30:07 -0700 (PDT)
Received: from localhost (28.red-83-37-139.dynamicip.rima-tde.net.
	[83.37.139.28]) by smtp.gmail.com with ESMTPSA id
	b186sm15315951wmd.16.2019.10.04.16.30.06
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 04 Oct 2019 16:30:06 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: Brian Bunker <brian@purestorage.com>,
	device-mapper development <dm-devel@redhat.com>
References: <EF473529-CF81-4AE9-BD96-08624B59BA10@purestorage.com>
	<dd8cbe47-3dc8-4136-2e75-5c8694e6c412@gmail.com>
Message-ID: <08bb49d9-5a9e-62b9-99c4-d11e7013c823@gmail.com>
Date: Sat, 5 Oct 2019 01:30:05 +0200
MIME-Version: 1.0
In-Reply-To: <dd8cbe47-3dc8-4136-2e75-5c8694e6c412@gmail.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.68]);
	Fri, 04 Oct 2019 23:30:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Fri, 04 Oct 2019 23:30:09 +0000 (UTC) for IP:'209.85.221.66'
	DOMAIN:'mail-wr1-f66.google.com' HELO:'mail-wr1-f66.google.com'
	FROM:'xose.vazquez@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.66 mail-wr1-f66.google.com 209.85.221.66
	mail-wr1-f66.google.com <xose.vazquez@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Fri, 04 Oct 2019 23:30:38 +0000 (UTC)

T24gMTAvNC8xOSAxMDo1MSBQTSwgWG9zZSBWYXpxdWV6IFBlcmV6IHdyb3RlOgoKPiBPbiA2LzI2
LzE5IDc6MzcgUE0sIEJyaWFuIEJ1bmtlciB3cm90ZToKPiAKPj4gSXQgaGFzIGJlZW4gc29tZSB0
aW1lIHNpbmNlIHdlIHVwZGF0ZWQgb3VyIFBVUkUgRmxhc2hBcnJheSBjb25maWd1cmF0aW9uLiBU
aGUKPj4gTGludXggdmVuZG9ycyB0aGF0IHdlIGhhZCBiZWVuIHNlZWluZyBpbiB0aGUgZmllbGQg
d2VyZSB1c2luZyB2ZXJ5IG9sZCB2ZXJzaW9ucwo+PiBvZiBtdWx0aXBhdGgtdG9vbHMsIHNvIHdl
IGhhdmVu4oCZdCBuZWVkZWQgdG8gY2hhbmdlIGFueXRoaW5nIGZvciBzb21lIHRpbWUuIFdpdGgK
Pj4gdGhlIHJlbGVhc2Ugb2YgUkhFTDgsIHNvbWUgb2Ygb3VyIGVhcmxpZXIgdmFsdWVzIGhhdmUg
YmVlbiBsb3N0IGJ5IHVwc3RyZWFtCj4+IGNoYW5nZXMuIAo+IAo+IFJlc2VuZCBpdCwgd2l0aCBD
QzogQ2hyaXN0b3BoZSBWYXJvcXVpIDxjaHJpc3RvcGhlLnZhcm9xdWlAb3BlbnN2Yy5jb20+CgpD
b3VsZCB5b3UgcGxlYXNlIGFsc28gc2VuZCB0aGUgY29uZi4gZm9yIE5WTWUgZGV2aWNlcyBbMV0g
PwoKVGhhbmsgeW91LgoKClsxXSBodHRwczovL2Jsb2cucHVyZXN0b3JhZ2UuY29tL252bWVvZi1y
b2NlLXN1c2UtMTUvCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNv
bQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=
