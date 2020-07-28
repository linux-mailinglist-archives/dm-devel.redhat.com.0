Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 29BE5231274
	for <lists+dm-devel@lfdr.de>; Tue, 28 Jul 2020 21:21:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-vbFj02x-PluJYo2TPwVwSg-1; Tue, 28 Jul 2020 15:21:03 -0400
X-MC-Unique: vbFj02x-PluJYo2TPwVwSg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FE14193F56D;
	Tue, 28 Jul 2020 19:20:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFDF35DA33;
	Tue, 28 Jul 2020 19:20:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 986981809554;
	Tue, 28 Jul 2020 19:20:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06SJKOBA030857 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Jul 2020 15:20:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A67FB2026D69; Tue, 28 Jul 2020 19:20:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1C712026D5D
	for <dm-devel@redhat.com>; Tue, 28 Jul 2020 19:20:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 987DF833B7D
	for <dm-devel@redhat.com>; Tue, 28 Jul 2020 19:20:22 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-1-sVtOhLcXN-6e_4w9YeLvBQ-1; Tue, 28 Jul 2020 15:20:20 -0400
X-MC-Unique: sVtOhLcXN-6e_4w9YeLvBQ-1
Received: by mail-pg1-f196.google.com with SMTP id l12so1527711pgt.13
	for <dm-devel@redhat.com>; Tue, 28 Jul 2020 12:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6vfxP0xAICcExvQMz/4lQvBsGt+MbkdQCG7TPtmY2IU=;
	b=dJ8FS0m90pmSr9GQEgjYvbi5GqITSvRgVxAB+I0DdNEV80XnLiUDjC5Oz+p50EzIE1
	vlJCIKtzVfnTzDl/9x3ThrzSfrXM+KnhG+fCX16I8sZoFGm2SLT2aS9ENmGIye2jysI3
	1BmT8NMV+Gkx0Z7N68oLXIZJ8fjHxYeUL3hIXVx67Sa0kN2G12t6F6xEOZXs8vf6uPoQ
	+ebJVS606Kz1L9HPWWWLfpF12pSdag4pvoC1DLGFf+Et9LWixaxTIF9dlVwPpmep52+g
	rmRZiXTcXT/7m1m85okOkXa26F/nTCN93XVx3LUkd3qsmWaa5MDrZQeJuHwDcMyI5Foo
	oY3Q==
X-Gm-Message-State: AOAM53013gZtBba5fwyA7ge4ZULHGUI8+MZkvio/+7mzbKetdVQ+Y/3z
	fV8ghOQ72CvEY/g8iXltSiNcng==
X-Google-Smtp-Source: ABdhPJxBQ70KSlhfE4UBk48wOVO+oTR3dAvGMGkYXZNgophmfDok6SYnNj9+4QpInUFKqraP2ypplA==
X-Received: by 2002:a63:3c16:: with SMTP id j22mr26658462pga.335.1595964018789;
	Tue, 28 Jul 2020 12:20:18 -0700 (PDT)
Received: from [192.168.1.182] ([66.219.217.173])
	by smtp.gmail.com with ESMTPSA id e8sm8642552pfd.34.2020.07.28.12.20.16
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 28 Jul 2020 12:20:18 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
References: <20200724073313.138789-1-hch@lst.de>
	<0b2b59d4-da4c-33df-82b4-0d4935b91e6e@kernel.dk>
Message-ID: <08ded32a-cf3a-55b0-6a88-19d201edac93@kernel.dk>
Date: Tue, 28 Jul 2020 13:20:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0b2b59d4-da4c-33df-82b4-0d4935b91e6e@kernel.dk>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, cgroups@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [dm-devel] bdi cleanups v3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gNy8yOC8yMCA5OjQxIEFNLCBKZW5zIEF4Ym9lIHdyb3RlOgo+IE9uIDcvMjQvMjAgMTozMiBB
TSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4+IEhpIEplbnMsCj4+Cj4+IHRoaXMgc2VyaWVz
IGNvbnRhaW5zIGEgYnVuY2ggb2YgZGlmZmVyZW50IEJESSBjbGVhbnVwcy4gIFRoZSBiaWdnZXN0
IGl0ZW0KPj4gaXMgdG8gaXNvbGF0ZSBibG9jayBkcml2ZXJzIGZyb20gdGhlIEJESSBpbiBwcmVw
YXJhdGlvbiBvZiBjaGFuZ2luZyB0aGUKPj4gbGlmZXRpbWUgb2YgdGhlIGJsb2NrIGRldmljZSBC
REkgaW4gYSBmb2xsb3cgdXAgc2VyaWVzLgo+IAo+IEFwcGxpZWQsIHRoYW5rcy4KCkRyb3BwZWQ6
CgogIENDICAgICAgYmxvY2svYmxrLXN5c2ZzLm8KYmxvY2svYmxrLXN5c2ZzLmM6NjA4OjE2OiBl
cnJvcjog4oCYYmxrX3Rocm90bF9zYW1wbGVfc2hvd+KAmSB1bmRlY2xhcmVkIGhlcmUgKG5vdCBp
biBhIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmGJsa190aHJvdGxfc2FtcGxlX2VudHJ54oCZ
PwogIDYwOCB8IFFVRVVFX1JXX0VOVFJZKGJsa190aHJvdGxfc2FtcGxlLCAidGhyb3R0bGVfc2Ft
cGxlX3RpbWUiKTsKICAgICAgfCAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fgpibG9j
ay9ibGstc3lzZnMuYzo1NjM6MTA6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8g4oCYUVVF
VUVfUldfRU5UUlnigJkKICA1NjMgfCAgLnNob3cgPSBfcHJlZml4IyNfc2hvdywgICBcCiAgICAg
IHwgICAgICAgICAgXn5+fn5+fgpibG9jay9ibGstc3lzZnMuYzo2MDg6MTY6IGVycm9yOiDigJhi
bGtfdGhyb3RsX3NhbXBsZV9zdG9yZeKAmSB1bmRlY2xhcmVkIGhlcmUgKG5vdCBpbiBhIGZ1bmN0
aW9uKTsgZGlkIHlvdSBtZWFuIOKAmGJsa190aHJvdGxfc2FtcGxlX2VudHJ54oCZPwogIDYwOCB8
IFFVRVVFX1JXX0VOVFJZKGJsa190aHJvdGxfc2FtcGxlLCAidGhyb3R0bGVfc2FtcGxlX3RpbWUi
KTsKICAgICAgfCAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fgpibG9jay9ibGstc3lz
ZnMuYzo1NjQ6MTE6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8g4oCYUVVFVUVfUldfRU5U
UlnigJkKICA1NjQgfCAgLnN0b3JlID0gX3ByZWZpeCMjX3N0b3JlLCAgIFwKICAgICAgfCAgICAg
ICAgICAgXn5+fn5+fgpibG9jay9ibGstc3lzZnMuYzo2NTc6MzogZXJyb3I6IOKAmGJsa190aHJv
dGxfc2FtcGxlX3RpbWVfZW50cnnigJkgdW5kZWNsYXJlZCBoZXJlIChub3QgaW4gYSBmdW5jdGlv
bik7IGRpZCB5b3UgbWVhbiDigJhibGtfdGhyb3RsX3NhbXBsZV90aW1lX3N0b3Jl4oCZPwogIDY1
NyB8ICAmYmxrX3Rocm90bF9zYW1wbGVfdGltZV9lbnRyeS5hdHRyLAogICAgICB8ICAgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgogICAgICB8ICAgYmxrX3Rocm90bF9zYW1wbGVfdGltZV9z
dG9yZQpibG9jay9ibGstc3lzZnMuYzo2MDg6MTY6IHdhcm5pbmc6IOKAmGJsa190aHJvdGxfc2Ft
cGxlX2VudHJ54oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC12YXJpYWJsZV0KICA2
MDggfCBRVUVVRV9SV19FTlRSWShibGtfdGhyb3RsX3NhbXBsZSwgInRocm90dGxlX3NhbXBsZV90
aW1lIik7CiAgICAgIHwgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn4KYmxvY2svYmxr
LXN5c2ZzLmM6NTYxOjMzOiBub3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvIOKAmFFVRVVFX1JX
X0VOVFJZ4oCZCiAgNTYxIHwgc3RhdGljIHN0cnVjdCBxdWV1ZV9zeXNmc19lbnRyeSBfcHJlZml4
IyNfZW50cnkgPSB7IFwKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+
fn5+fn4KbWFrZVsxXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI4MTogYmxvY2svYmxr
LXN5c2ZzLm9dIEVycm9yIDEKbWFrZTogKioqIFtNYWtlZmlsZToxNzU2OiBibG9ja10gRXJyb3Ig
MgoKZnJvbSAiYmxvY2s6IGFkZCBoZWxwZXIgbWFjcm9zIGZvciBxdWV1ZSBzeXNmcyBlbnRyaWVz
IgoKVGhpcyBoYXMgbm90IHNlZW4gYSBmdWxsIGNvbXBpbGUgdGVzdCBldmVuLi4uCgotLSAKSmVu
cyBBeGJvZQoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0
cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

