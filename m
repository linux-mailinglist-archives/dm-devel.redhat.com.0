Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2A921A1BD
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 16:05:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-2yc__gwaMLmAHs94uaq3aA-1; Thu, 09 Jul 2020 10:05:25 -0400
X-MC-Unique: 2yc__gwaMLmAHs94uaq3aA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9C6D8015F7;
	Thu,  9 Jul 2020 14:05:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 262F379801;
	Thu,  9 Jul 2020 14:05:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EDBCD84350;
	Thu,  9 Jul 2020 14:05:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069Dx693021683 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 09:59:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C12BD2166BA3; Thu,  9 Jul 2020 13:59:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBBCB2166BA2
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 13:59:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE5EE924900
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 13:59:03 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-104-jIUQxEguO9ylC0wTLhB_-g-1; Thu, 09 Jul 2020 09:59:00 -0400
X-MC-Unique: jIUQxEguO9ylC0wTLhB_-g-1
Received: by mail-io1-f66.google.com with SMTP id f23so2399365iof.6
	for <dm-devel@redhat.com>; Thu, 09 Jul 2020 06:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ttUciq1R4DLXwSrCKOG8sMg2/ZhVL4qipuIgKqQy2hE=;
	b=iEWke7W4V6ZsxpkqsjJnEDp1Z0tmA1Snv8wR9+02KY9XWRMx8tpPxtOG3HLIHBaRgM
	vNAURCZ+zD8oNfLGE9dwE1mDuejzONEB4gyBYdIu2pT8hTfMEa4QLFRjGL5YPZo4Hc9S
	6+O51Uou+zUBRO/IOynE7NEJ4oy34yuE0A1IGT/5oGuMXYMisgfd9VA96ppJXqVxGobK
	7peQANDd14Wg31jOpD93bu4DFF7g37gvZ82wyLTK1oHe9Ch54ni08KezYdAlfnVj4QUo
	laUNPU4nQUyN+lYKZeVWGpjWLxlZfVY8xvJjEkOkAjl+P+176/LU08P0ZhoAgDvDuUeA
	q9WQ==
X-Gm-Message-State: AOAM530V4nMB9BmOw7wQkvDwrrJfaP7HHPXjVw4gUKL6jgC0MnUmOZ1V
	C/gvlZuJwUde4kC5ZbVkjmPJeQ==
X-Google-Smtp-Source: ABdhPJwILxLSUCxDdCac/fZUN7tHM3l14dJ0zrZ6D/Tc1v+OsXoh2HYNZYg6WBqjtOr30hdwGoEJQw==
X-Received: by 2002:a05:6638:168e:: with SMTP id
	f14mr67991477jat.64.1594303139999; 
	Thu, 09 Jul 2020 06:58:59 -0700 (PDT)
Received: from [192.168.1.58] ([65.144.74.34])
	by smtp.gmail.com with ESMTPSA id a1sm1884363ilq.50.2020.07.09.06.58.58
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 09 Jul 2020 06:58:59 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20200701090622.3354860-1-hch@lst.de>
	<b5d6df17-68af-d535-79e4-f95e16dd5632@kernel.dk>
	<20200709053233.GA3243@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <82e2785d-2091-1986-0014-3b7cea7cd0d8@kernel.dk>
Date: Thu, 9 Jul 2020 07:58:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200709053233.GA3243@lst.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, linux-mm@kvack.org,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, drbd-dev@tron.linbit.com,
	dm-devel@redhat.com, Tejun Heo <tj@kernel.org>,
	cgroups@vger.kernel.org, linux-btrfs@vger.kernel.org
Subject: Re: [dm-devel] remove dead bdi congestion leftovers
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gNy84LzIwIDExOjMyIFBNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBPbiBXZWQsIEp1
bCAwOCwgMjAyMCBhdCAwNToxNDoyOVBNIC0wNjAwLCBKZW5zIEF4Ym9lIHdyb3RlOgo+PiBPbiA3
LzEvMjAgMzowNiBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4+PiBIaSBKZW5zLAo+Pj4K
Pj4+IHdlIGhhdmUgYSBsb3Qgb2YgYmRpIGNvbmdlc3Rpb24gcmVsYXRlZCBjb2RlIHRoYXQgaXMg
bGVmdCBhcm91bmQgd2l0aG91dAo+Pj4gYW55IHVzZS4gIFRoaXMgc2VyaWVzIHJlbW92ZXMgaXQg
aW4gcHJlcGFyYXRpb24gb2Ygc29ydGluZyBvdXQgdGhlIGJkaQo+Pj4gbGlmZXRpbWUgcnVsZXMg
cHJvcGVybHkuCj4+Cj4+IFBsZWFzZSBydW4gc2VyaWVzIGxpa2UgdGhpcyB0aHJvdWdoIGEgZnVs
bCBjb21waWxhdGlvbiwgZm9yIGJvdGggdGhpcyBvbmUKPj4gYW5kIHRoZSBwcmV2aW91cyBzZXJp
ZXMgSSBoYWQgdG8gZml4IHVwIGlzc3VlcyBsaWtlIHRoaXM6Cj4+Cj4+IGRyaXZlcnMvbWQvYmNh
Y2hlL3JlcXVlc3QuYzogSW4gZnVuY3Rpb24g4oCYYmNoX2NhY2hlZF9kZXZfcmVxdWVzdF9pbml0
4oCZOgo+PiBkcml2ZXJzL21kL2JjYWNoZS9yZXF1ZXN0LmM6MTIzMzoxODogd2FybmluZzogdW51
c2VkIHZhcmlhYmxlIOKAmGfigJkgWy1XdW51c2VkLXZhcmlhYmxlXQo+PiAgMTIzMyB8ICBzdHJ1
Y3QgZ2VuZGlzayAqZyA9IGRjLT5kaXNrLmRpc2s7Cj4+ICAgICAgIHwgICAgICAgICAgICAgICAg
ICBeCj4+IGRyaXZlcnMvbWQvYmNhY2hlL3JlcXVlc3QuYzogSW4gZnVuY3Rpb24g4oCYYmNoX2Zs
YXNoX2Rldl9yZXF1ZXN0X2luaXTigJk6Cj4+IGRyaXZlcnMvbWQvYmNhY2hlL3JlcXVlc3QuYzox
MzIwOjE4OiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUg4oCYZ+KAmSBbLVd1bnVzZWQtdmFyaWFi
bGVdCj4+ICAxMzIwIHwgIHN0cnVjdCBnZW5kaXNrICpnID0gZC0+ZGlzazsKPj4gICAgICAgfCAg
ICAgICAgICAgICAgICAgIF4KPj4KPj4gRGlkIHRoZSBzYW1lIGhlcmUsIGFwcGxpZWQgaXQuCj4g
Cj4gQW5kIGp1c3QgbGlrZSB0aGUgcHJldmlvdXMgb25lIEkgZGlkLCBhbmQgdGhlIGNvbXBpbGVy
IGRpZCBub3QgY29tcGxhaW4uCj4gVGhlcmUgbXVzdCBiZSBzb21ldGhpbmcgYWJvdXQgY2VydGFp
biBnY2MgdmVyc2lvbnMgbm90IHdhcm5pbmcgYWJvdXQKPiB2YXJpYWJsZXMgdGhhdCBhcmUgaW5p
dGlhbGl6ZWQgYnV0IG5vdCBvdGhlcndpc2UgdXNlZC4KCkFyZSB5b3UgdXNpbmcgZ2NjLTEwPyBJ
dCBzdWNrcyBmb3IgdGhhdC4gZ2NjLTkgc2VlbXMgdG8gcmVsaWFibHkgaGl0CnRoZXNlIGNhc2Vz
IGZvciBtZSwgbm90IHN1cmUgd2h5IGdjYy0xMCBkb2Vzbid0LiBBbmQgdGhlIG9uZXMgcXVvdGVk
CmFib3ZlIGFyZSBhYm91dCBhcyB0cml2aWFsIGFzIHRoZXkgY2FuIGdldC4KCi0tIApKZW5zIEF4
Ym9lCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczov
L3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

