Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 720A0642FDE
	for <lists+dm-devel@lfdr.de>; Mon,  5 Dec 2022 19:24:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670264668;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XqFt4W2VHiALIjXneKKcQob+N0l1B085HwFRGas1oSw=;
	b=fG9NRe+ZcdEdCcAlqk246HG/DncPYUn02aaaWkC4vT8FEdFw/2D5w0MDi+8U+5wi7wlC8R
	ZUgADSmIogCZbvQWyrmh41tT2B0scJsuPDHdTQPOb3UWecnMYttmgfo47OkJCwjD46TdwB
	SiXY0AhfLYw+ObP34qVJkxfXLZXzZ1E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-KNGLXnkQN_6cxIOBL_su5g-1; Mon, 05 Dec 2022 13:24:26 -0500
X-MC-Unique: KNGLXnkQN_6cxIOBL_su5g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CB4F1C09C83;
	Mon,  5 Dec 2022 18:24:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F71A40C846A;
	Mon,  5 Dec 2022 18:24:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D07A619465A0;
	Mon,  5 Dec 2022 18:24:15 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 386EC1946588
 for <dm-devel@listman.corp.redhat.com>; Mon,  5 Dec 2022 18:24:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6C1482028CE4; Mon,  5 Dec 2022 18:24:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6517B200BA9A
 for <dm-devel@redhat.com>; Mon,  5 Dec 2022 18:24:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4645818E0A68
 for <dm-devel@redhat.com>; Mon,  5 Dec 2022 18:24:07 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-357-lpZH6zB3OViKqcTm2BNwVw-1; Mon, 05 Dec 2022 13:24:04 -0500
X-MC-Unique: lpZH6zB3OViKqcTm2BNwVw-1
Received: by mail-pg1-f171.google.com with SMTP id 6so11209834pgm.6
 for <dm-devel@redhat.com>; Mon, 05 Dec 2022 10:24:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MiaU0h+bdhLcyz46u9rPXY7SBRUUk1LjjV2sWNv5RLY=;
 b=Mn8nNUP82fdfVCtjrHD5RZMBj+u3XEOUxp2zukSi7KeSBiUzRnAurwYe22FDZ+hGab
 eJwyV2SjyVcOhiOXCGbrb3zKetNzWjujqr1ySmcoj3mxKdndlzGNyix6/2G//pfIunC0
 GqFCNzllbEs97VnL9eJN3Vi2F2534XHz2HHj7S8YmYVG/pNvGf32jFyRmVECjz0bsVwi
 NM7idu8FmpV0QmuFAmbAPf18g364SpdKpqRP1SqXjOQsy96s8Nb/NaCUdz/eMdOvn+3n
 EbTIU0Ph2KuY6VgbWH6eejDS4p+FC2El1JLWZezDKQw4fEJuI+v30mvyln+1V7n6B7Fg
 OIhA==
X-Gm-Message-State: ANoB5pkR0MZxiSEZCpK4rJiGyhBK+Lsczi6sTKc9pNpO31/IH3xMc/NV
 1yBYdnhQScGaA8lj/obIIYhprw==
X-Google-Smtp-Source: AA0mqf6jZL7CMm0mQFuDdI6JgmGYYwGjfVoJPowXsYQWIx6DQ5YO6ZYAjPvSltOjb7zYJtxe7LeLEA==
X-Received: by 2002:a05:6a00:2396:b0:56c:318a:f808 with SMTP id
 f22-20020a056a00239600b0056c318af808mr68347160pfc.11.1670264643685; 
 Mon, 05 Dec 2022 10:24:03 -0800 (PST)
Received: from ?IPV6:2600:380:4a37:5fe7:dac6:a7fe:6a6b:c11a?
 ([2600:380:4a37:5fe7:dac6:a7fe:6a6b:c11a])
 by smtp.gmail.com with ESMTPSA id
 72-20020a62154b000000b0056283e2bdbdsm4726356pfv.138.2022.12.05.10.24.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 10:24:03 -0800 (PST)
Message-ID: <fe2800f1-aaae-33e8-aaf0-83fd034162d5@kernel.dk>
Date: Mon, 5 Dec 2022 11:24:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
To: Alvaro Karsz <alvaro.karsz@solid-run.com>,
 virtualization@lists.linux-foundation.org
References: <20221205162035.2261037-1-alvaro.karsz@solid-run.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20221205162035.2261037-1-alvaro.karsz@solid-run.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [dm-devel] [PATCH v3] virtio_blk: add VIRTIO_BLK_F_LIFETIME
 feature support
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
Cc: linux-scsi@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMTIvNS8yMiA5OjIw4oCvQU0sIEFsdmFybyBLYXJzeiB3cm90ZToKPiBJbXBsZW1lbnQgdGhl
IFZJUlRJT19CTEtfRl9MSUZFVElNRSBmZWF0dXJlIGZvciBWaXJ0SU8gYmxvY2sgZGV2aWNlcy4K
PiAKPiBUaGlzIGNvbW1pdCBpbnRyb2R1Y2VzIGEgbmV3IGlvY3RsIGNvbW1hbmQsIFZCTEtfTElG
RVRJTUUuCj4gCj4gVkJMS19MSUZFVElNRSBpb2N0bCBhc2tzIGZvciB0aGUgYmxvY2sgZGV2aWNl
IHRvIHByb3ZpZGUgbGlmZXRpbWUKPiBpbmZvcm1hdGlvbiBieSBzZW5kaW5nIGEgVklSVElPX0JM
S19UX0dFVF9MSUZFVElNRSBjb21tYW5kIHRvIHRoZSBkZXZpY2UuCj4gCj4gbGlmZXRpbWUgaW5m
b3JtYXRpb24gZmllbGRzOgo+IAo+IC0gcHJlX2VvbF9pbmZvOiBzcGVjaWZpZXMgdGhlIHBlcmNl
bnRhZ2Ugb2YgcmVzZXJ2ZWQgYmxvY2tzIHRoYXQgYXJlCj4gCQljb25zdW1lZC4KPiAJCW9wdGlv
bmFsIHZhbHVlcyBmb2xsb3dpbmcgdmlydGlvIHNwZWM6Cj4gCQkqKSAwIC0gdW5kZWZpbmVkLgo+
IAkJKikgMSAtIG5vcm1hbCwgPCA4MCUgb2YgcmVzZXJ2ZWQgYmxvY2tzIGFyZSBjb25zdW1lZC4K
PiAJCSopIDIgLSB3YXJuaW5nLCA4MCUgb2YgcmVzZXJ2ZWQgYmxvY2tzIGFyZSBjb25zdW1lZC4K
PiAJCSopIDMgLSB1cmdlbnQsIDkwJSBvZiByZXNlcnZlZCBibG9ja3MgYXJlIGNvbnN1bWVkLgo+
IAo+IC0gZGV2aWNlX2xpZmV0aW1lX2VzdF90eXBfYTogdGhpcyBmaWVsZCByZWZlcnMgdG8gd2Vh
ciBvZiBTTEMgY2VsbHMgYW5kCj4gCQkJICAgICBpcyBwcm92aWRlZCBpbiBpbmNyZW1lbnRzIG9m
IDEwdXNlZCwgYW5kIHNvCj4gCQkJICAgICBvbiwgdGhydSB0byAxMSBtZWFuaW5nIGVzdGltYXRl
ZCBsaWZldGltZQo+IAkJCSAgICAgZXhjZWVkZWQuIEFsbCB2YWx1ZXMgYWJvdmUgMTEgYXJlIHJl
c2VydmVkLgo+IAo+IC0gZGV2aWNlX2xpZmV0aW1lX2VzdF90eXBfYjogdGhpcyBmaWVsZCByZWZl
cnMgdG8gd2VhciBvZiBNTEMgY2VsbHMgYW5kIGlzCj4gCQkJICAgICBwcm92aWRlZCB3aXRoIHRo
ZSBzYW1lIHNlbWFudGljcyBhcwo+IAkJCSAgICAgZGV2aWNlX2xpZmV0aW1lX2VzdF90eXBfYS4K
PiAKPiBUaGUgZGF0YSByZWNlaXZlZCBmcm9tIHRoZSBkZXZpY2Ugd2lsbCBiZSBzZW50IGFzIGlz
IHRvIHRoZSB1c2VyLgo+IE5vIGRhdGEgY2hlY2svZGVjb2RlIGlzIGRvbmUgYnkgdmlydGJsay4K
CklzIHRoaXMgYmFzZWQgb24gc29tZSBzcGVjPyBCZWNhdXNlIGl0IGxvb2tzIHByZXR0eSBvZGQg
dG8gbWUuIFRoZXJlCmNhbiBiZSBhIHByZXR0eSB3aWRlIHJhbmdlIG9mIHR3by90aHJlZS9ldGMg
bGV2ZWwgY2VsbHMgd2l0aCB3aWxkbHkKZGlmZmVyZW50IHJhbmdlcyBvZiBkdXJhYmlsaXR5LiBB
bmQgdGhlcmUncyByZWFsbHkgbm90IGEgbG90IG9mIHNsYwpmb3IgZ2VuZXJpYyBkZXZpY2VzIHRo
ZXNlIGRheXMsIGlmIGFueS4KCi0tIApKZW5zIEF4Ym9lCgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBs
aXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1h
bi9saXN0aW5mby9kbS1kZXZlbAo=

