Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A7A460720
	for <lists+dm-devel@lfdr.de>; Sun, 28 Nov 2021 16:34:17 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-fP7Yu9bgMoKh8ogmfJK3RQ-1; Sun, 28 Nov 2021 10:34:14 -0500
X-MC-Unique: fP7Yu9bgMoKh8ogmfJK3RQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F27B118460E5;
	Sun, 28 Nov 2021 15:34:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1E725D9DE;
	Sun, 28 Nov 2021 15:33:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE64B4BB7C;
	Sun, 28 Nov 2021 15:33:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ASFXEP6001908 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 28 Nov 2021 10:33:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4842E2026D65; Sun, 28 Nov 2021 15:33:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 416C72026D4D
	for <dm-devel@redhat.com>; Sun, 28 Nov 2021 15:33:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C599811E76
	for <dm-devel@redhat.com>; Sun, 28 Nov 2021 15:33:11 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-397--JNX1h0jMaiqSJnoWlf0IA-1; Sun, 28 Nov 2021 10:33:07 -0500
X-MC-Unique: -JNX1h0jMaiqSJnoWlf0IA-1
Received: by mail-wm1-f47.google.com with SMTP id
	r9-20020a7bc089000000b00332f4abf43fso9767567wmh.0; 
	Sun, 28 Nov 2021 07:33:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=lEX+V2GLhUwQoOAcVKOivAqT1xoRqKcJWYhPuY0yLB8=;
	b=fb+K/tnEg8GHMq/+h9b9esMPdQ+soPxjUb7d/iYJcEP+KvmIkhGKvCz5YiBstJIYz1
	eIolo7kS6+OsmzmvXCFtGGmB4wmovEAyA66tQZEESWADPitvfrguVTW9k+2pZh8A/2xR
	fP/QEp3Tfdpm9QiCr8ED0DYuJU/8SqEh4/uLt0l+VX09TdTTjY5VT/qiLUS5zaHZZywE
	t26+tv0naWQH5oNSGgA9bEIrnklXiZb98pPy0D2Ee2YFXzwy3Y6t73LXNff081uWMyqm
	zp6QH1NJtVVlEKnpkM3hNVT478+q1R9hUiZMaMe3xfAXz59Rag1XXAEyCQP5e9YSSTTk
	eLEw==
X-Gm-Message-State: AOAM5326nijrlEm+W2Oset+HHXu/At8zFBVGXbslA55bSNdt31DTjCwF
	7/9CHfRM7jxUTX0DSBida45B0qofnsJPUguT
X-Google-Smtp-Source: ABdhPJwI2i27wwhC+sV3bxM1RCDscjr0SGpcR4FYekZ/yuEB7QLdOiZUQoXW/K+9UZAE4R1n+d25Mw==
X-Received: by 2002:a1c:ed18:: with SMTP id l24mr31094090wmh.99.1638113585665; 
	Sun, 28 Nov 2021 07:33:05 -0800 (PST)
Received: from [10.53.134.167] ([193.169.71.150])
	by smtp.gmail.com with ESMTPSA id
	m17sm10868723wrz.22.2021.11.28.07.33.04
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 28 Nov 2021 07:33:05 -0800 (PST)
To: Milan Broz <gmazyland@gmail.com>, dm-devel@redhat.com
References: <CAFpOueRBb9y_Fgb3-c6_eFTKZR9DoAXZmxqqx0UH1Yb2rbV0RQ@mail.gmail.com>
	<da6989dc-1fab-cbd0-4ea9-1b60ea9de964@gmail.com>
	<c93ae166-faf8-f00f-7e63-b852a224310c@gmail.com>
	<0efdd94f-94f4-1330-fe99-ec395d0c84ff@gmail.com>
	<f5d040b9-3b71-91f5-d55e-ef2f4db5a86b@gmail.com>
From: Itai Handler <itai.handler@gmail.com>
Message-ID: <57bd1b0d-ac93-c266-3b25-cc60ac086ccd@gmail.com>
Date: Sun, 28 Nov 2021 17:33:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <f5d040b9-3b71-91f5-d55e-ef2f4db5a86b@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Mikulas Patocka <mpatocka@redhat.com>, agk@redhat.com, snitzer@redhat.com
Subject: Re: [dm-devel] [RFC PATCH 1/1] dm crypt: change maximum sector size
 to PAGE_SIZE
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMjcvMTEvMjAyMSAxMzoxOSwgTWlsYW4gQnJveiB3cm90ZToKPiBPbiAxMS8yNS8yMSAxNzoy
OCwgSXRhaSBIYW5kbGVyIHdyb3RlOgo+PiBPbiAxNC8xMS8yMDIxIDEzOjU2LCBJdGFpIEhhbmRs
ZXIgd3JvdGU6Cj4+PiBPbiAxMS8xMS8yMDIxIDE1OjA3LCBNaWxhbiBCcm96IHdyb3RlOgo+Pj4+
IE9uIDEwLzExLzIwMjEgMTg6NDMsIEl0YWkgSGFuZGxlciB3cm90ZToKPj4+Pj4gTWF4aW11bSBz
ZWN0b3Igc2l6ZSBvZiBkbS1jcnlwdCBpcyBjdXJyZW50bHkgbGltaXRlZCB0byA0MDk2IGJ5dGVz
Lgo+Pj4+Pgo+Pj4+PiBPbiBzeXN0ZW1zIHdoZXJlIFBBR0VfU0laRSBpcyBsYXJnZXIgdGhhbiA0
MDk2IGJ5dGVzLCB1c2luZyBsYXJnZXIKPj4+Pj4gc2VjdG9ycyBjYW4gYmUgYmVuZWZpY2lhbCBm
b3IgcGVyZm9ybWFuY2UgcmVhc29ucy4KPj4+Pgo+Pj4+IFRoZSBsaW1pdCB0byA0MDk2IHdhcyBz
ZXQgYmVjYXVzZSB0aGlzIGlzIHRoZSBzbWFsbGVzdCBwb3NzaWJsZQo+Pj4+IHBhZ2Ugc2l6ZSB0
aGF0IGFsbCBwbGF0Zm9ybSBzdXBwb3J0cy4KPj4+Pgo+Pj4+IElmIHlvdSBhbGxvdyBhIGhpZ2hl
ciBzaXplIGhlcmUsIHRoZSBkZXZpY2UgY2Fubm90IGJlIGFjdGl2YXRlZCBvbiBhCj4+Pj4gcGxh
dGZvcm0KPj4+PiB3aXRoIHRoZSBzbWFsbGVyIHBhZ2Ugc2l6ZS4gKEVuY3J5cHRlZCBzZWN0b3Ig
c2l6ZSBiZWNvbWVzCj4+Pj4gYXRvbWljIHNlY3RvciBzaXplIGZvciBhbGwgdXBwZXIgbGF5ZXJz
IC0gYXMgeW91IG1lbnRpb24gYmVsb3csIG5vdAo+Pj4+IGFsbCBmcyBzdXBwb3J0IGJpZ2dlciBz
ZWN0b3JzLikKPj4+Pgo+Pj4+IEZvciBMVUtTLCB0aGlzIGlzIG5vdCBhY2NlcHRhYmxlIC0gdGhl
IGZvcm1hdCBpcyBwb3J0YWJsZSBieSBkZWZpbml0aW9uLgo+Pj4+Cj4+Pj4gRm9yIHNwZWNpZmlj
IGRtLWNyeXB0IGRldmljZSwgSSBhbSBub3Qgc3VyZS4gSSB3b3VsZCBiZXR0ZXIga2VwdAo+Pj4+
IHRoZSA0MDk2IHBhZ2Ugc2l6ZSBsaW1pdCBoZXJlLgo+Pj4KPj4+IEkgY29uc2lkZXJlZCBvbmx5
IHBsYWluIGRtLWNyeXB0IHNpbmNlIEkgYW0gdW5mYW1pbGlhciB3aXRoIExVS1MuCj4+PiBEb2Vz
IExVS1MgYXNzdW1lIHRoYXQgZG0tY3J5cHQgc2VjdG9yIHNpemUgaXMgbGltaXRlZCB0byA0Sz8K
Pj4+IElmIHNvLCBtYXliZSBJJ2xsIGJlIGFibGUgdG8gYWxzbyBwYXRjaCBMVUtTIHJlZ2FyZGlu
ZyB0aGlzIGlzc3VlLgo+Pj4KPj4+Pgo+Pj4+IEl0IGFsc28gZGVwZW5kcyBvbiBjcnlwdG8gQVBJ
IGRyaXZlciBoZXJlIChwZXJmb3JtYW5jZSBpcyB1c3VhbGx5Cj4+Pj4gb3B0aW1pemVkIHRvIDRr
KS4KPj4+PiBXaGF0IGNpcGhlciBhbmQgZW5jcnlwdGlvbiBtb2RlIGRpZCB5b3UgdXNlIGZvciB0
ZXN0Pwo+Pj4KPj4+IFRoZSBjaXBoZXIgSSB1c2VkIGZvciB0aGUgdGVzdCBpcyBub3QgcHVibGlj
bHkgYXZhaWxhYmxlIGJ1dCBJIGNhbiBzYXkKPj4+IHRoYXQgaXQncyBwZXJmb3JtYW5jZQo+Pj4g
aXMgbm90IG9wdGltaXplZCB0byA0ayBibG9ja3MuCj4+PiBJIGJlbGlldmUgdGhhdCB0aGlzIHJl
c3VsdHMgZnJvbSB0aGUgaGlnaCBvdmVyaGVhZCBvZiBzZXR0aW5nIHVwIERNQQo+Pj4gdHJhbnNm
ZXJzLiAobXkKPj4+IGNpcGhlciB1c2VzIERNQSB0byB0cmFuc2ZlciBkYXRhIGJldHdlZW4gbWVt
b3J5IGFuZCBwcm9ncmFtbWFibGUgbG9naWMpLgo+Pj4gVGhlcmUgYXJlIG1hbnkgYWRkaXRpb25h
bCBjaXBoZXJzIHRoYXQgdXNlIERNQSBpbiB0aGUgdHJlZSwgYnV0IEkKPj4+IGNhbm5vdCBydW4g
YW55Cj4+PiBiZW5jaG1hcmsgd2l0aCB0aGVtIGF0IHRoZSBtb21lbnQuCj4+Pgo+Pj4gSSBoYXZl
IHBlcmZvcm1lZCBzb21lIGFkZGl0aW9uYWwgYmVuY2htYXJrcyB1c2luZyB0aGUgQVJNCj4+PiBD
cnlwdG9ncmFwaGljIEV4dGVuc2lvbnMKPj4+IENQVSBjaXBoZXJzIGFuZCBzYXcgdGhhdCBpbmNy
ZWFzaW5nIGJsb2NrIHNpemUgYmV5b25kIDRLIGRvZXMgaW5jcmVhc2UKPj4+IHBlcmZvcm1hbmNl
LAo+Pj4gYWxiZWl0IHRoZSBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudCBpc24ndCBhcyBsYXJnZSBh
cyBJJ3ZlIHNlZW4gd2hlbgo+Pj4gdXNpbmcgbXkgY2lwaGVyLgo+Pj4KPj4+IEZvbGxvd2luZyBh
cmUgInRjcnlwdCBtb2RlPTYwMCBzZWM9NSBudW1fbWI9NTEyIiByZXN1bHRzIGZvcgo+Pj4geHRz
LWFlcy1jZSBkZWNyeXB0aW9uCj4+PiAoQVJNIENQVSBDcnlwdG9ncmFwaGljIEV4dGVuc2lvbnMg
Y2lwaGVyKToKPj4+IMKgwqAgdGVzdGluZyBzcGVlZCBvZiBtdWx0aWJ1ZmZlciB4dHMoYWVzKSAo
eHRzLWFlcy1jZSkgZGVjcnlwdGlvbgo+Pj4gwqDCoCAuLi4KPj4+IMKgwqAgdHJjeXB0OiB0ZXN0
IDUgKDI1NiBiaXQga2V5LCA0MDk2IGJ5dGUgYmxvY2tzKTogODAxNzkyIG9wZXJhdGlvbnMgaW4K
Pj4+IDUgc2Vjb25kcyAoMzI4NDE0MDAzMiBieXRlcykKPj4+IMKgwqAgLi4uCj4+PiDCoMKgIHRy
Y3lwdDogdGVzdCA5ICgyNTYgYml0IGtleSwgNjU1MzYgYnl0ZSBibG9ja3MpOiA2MzQ4OCBvcGVy
YXRpb25zIGluCj4+PiA1IHNlY29uZHMgKDQxNjA3NDk1NjggYnl0ZXMpCj4+Pgo+Pj4gVGhhdCB0
cmFuc2xhdGVzIHRvOgo+Pj4gwqDCoCA2NTcgTUIvcyBmb3IgNEsgYnl0ZSBibG9ja3MuCj4+PiDC
oMKgIDgzMiBNQi9zIGZvciA2NEsgYmxvY2tzLgo+Pj4KPj4+IFRoYXQgbWVhbnMgdGhhdCB0aGVy
ZSBpcyBhYm91dCAyNyBwZXJjZW50cyBpbXByb3ZlbWVudCB3aGVuCj4+PiB0cmFuc2l0aW9uaW5n
IHRvIDY0SyBzZWN0b3JzLAo+Pj4gZm9yIHRoZSBjaXBoZXIgYWxvbmUgKG9ubHkgdGNyeXB0IGJl
bmNobWFyaykuCj4+Pgo+Pj4gVGhpcyBiZW5jaG1hcmsgaGFkIGJlZW4gcGVyZm9ybWVkIG9uIGFu
IEFSTSBDb3J0ZXggQTUzIENQVS4KPj4+IChOb3RlIHRoYXQgaW4gYWxsIG9mIG15IGJlbmNobWFy
a3MgUEFHRV9TSVpFPTY0SykuCj4+Pgo+Pj4+IEhvdyB0aGUgbnVtYmVyIGxvb2tzIGZvciByYW5k
b20gYWNjZXNzPyBMaW5lYXIgdGVzdCBpcyB1c3VhbGx5Cj4+Pj4gbWlzbGVhZGluZy4KPj4+PiBJ
IGV4cGVjdCB0aGVyZSB3aWxsIGJlIGJpZyBwZXJmb3JtYW5jZSBwcm9ibGVtIGlmIHlvdSB3cml0
ZSBzbWFsbAo+Pj4+IGRhdGEgY2h1bmtzLAo+Pj4+IHdyaXRlcyBhbmQgZW5jcnlwdGlvbiB3aWxs
IGJlIGFtcGxpZmllZCB0byBmdWxsIGJpZyBzZWN0b3JzIGhlcmUuLi4pCj4+PiBJIHVuZGVyc3Rh
bmQgeW91ciBjb25jZXJuLgo+Pj4gSG93ZXZlciBteSBwYXRjaCBkb2VzIG5vdCBmb3JjZSBhbnlv
bmUgdG8gdXNlIGxhcmdlIHNlY3RvcnMgLSBpdCBvbmx5Cj4+PiBvcGVucyB1cCB0aGlzCj4+PiBw
b3NzaWJpbGl0eSBmb3IgdGhvc2UgaW50ZXJlc3RlZCBpbiB0aGF0IG9wdGlvbi4KPj4+IFRoaXMg
aXMgc2ltaWxhcmx5IHRvIHRoZSBvcHRpb24gdG8gZm9ybWF0IGFuIGV4dDQgZmlsZXN5c3RlbSB3
aXRoIDY0Swo+Pj4gc2VjdG9ycy4KPj4+IEJ5IHRoZSB3YXk6IHdoZW4geW91IGRvIHRoYXQsIHlv
dSBnZXQgYSB3YXJuaW5nIHNheWluZyB0aGF0IHRoZQo+Pj4gZmlsZXN5c3RlbQo+Pj4gd2lsbCBu
b3QgYmUgdXNhYmxlIG9uIG1vc3Qgc3lzdGVtcy4KPj4+Cj4+PiBTb21ldGltZSB1c2VycyBuZWVk
IHRvIHN0b3JlIG1vc3RseSBsYXJnZSBmaWxlcyBvbiBhIGZpbGVzeXN0ZW0sIGZvcgo+Pj4gZXhh
bXBsZSBmb3IKPj4+IGJhY2t1cCBvciBmb3IgdmlkZW8gZmlsZXMuCj4+PiBJIHRoaW5rIHRoYXQg
aW4gdGhlc2UgY2FzZXMgcmFuZG9tIGFjY2VzcyB0aW1lIGlzIG5vdCBzbyBpbXBvcnRhbnQuCj4+
PiBTb21lIHVzZXJzIG1heSBhbHNvIGJlIGFibGUgdG8gcmVzZXJ2ZSBhIGRlZGljYXRlZCBwYXJ0
aXRpb24gZm9yCj4+PiBzdG9yaW5nIHN1Y2gKPj4+IGxhcmdlIGZpbGVzLgo+Pj4KPj4+Pgo+Pj4+
IChUZWNobmljYWwgZGV0YWlsOiBzdWNoIHBhdCBNVVNUIGluY3JlYXNlIGRtLWNyeXB0IG1pbm9y
IHZlcnNpb24uKQo+Pj4gVGhhbmtzIGZvciBwb2ludGluZyB0aGF0IG91dC4gSSBiZWxpZXZlIHRo
YXQgSSBjYW4gcHJlcGFyZSBhIHYyIHBhdGNoCj4+PiB0aGF0IHdpbGwKPj4+IGFkZHJlc3MgdGhh
dCBpc3N1ZS4KPj4+Pgo+Pj4+IE1pbGFuCj4+Pj4KPj4+Pj4KPj4+Pj4gVGhpcyBwYXRjaCBjaGFu
Z2VzIG1heGltdW0gc2VjdG9yIHNpemUgZnJvbSA0MDk2IGJ5dGVzIHRvIFBBR0VfU0laRSwKPj4+
Pj4gYW5kIGluIGFkZGl0aW9uIGl0IGNoYW5nZXMgdGhlIHR5cGUgb2Ygc2VjdG9yX3NpemUgaW4K
Pj4+Pj4gc3RydWN0IGNyeXB0X2NvbmZpZyBmcm9tICd1bnNpZ25lZCBzaG9ydCBpbnQnIHRvICd1
bnNpZ25lZCBpbnQnLCBpbgo+Pj4+PiBvcmRlciB0byBiZSBhYmxlIHRvIHJlcHJlc2VudCBsYXJn
ZXIgdmFsdWVzLgo+Pj4+Pgo+Pj4+PiBPbiBhIHByb3RvdHlwZSBzeXN0ZW0gd2hpY2ggaGFzIFBB
R0VfU0laRSBvZiA2NTUzNiBieXRlcywgSSBzYXcgYWJvdXQKPj4+Pj4geDIgcGVyZm9ybWFuY2Ug
aW1wcm92ZW1lbnQgaW4gc2VxdWVudGlhbCByZWFkIHRocm91Z2hwdXQgYmVuY2htYXJrCj4+Pj4+
IHdoaWxlIHVzaW5nIG9ubHkgYWJvdXQgaGFsZiBvZiB0aGUgQ1BVIHVzYWdlLCBhZnRlciBzaW1w
bHkgaW5jcmVhc2luZwo+Pj4+PiBzZWN0b3Igc2l6ZSBmcm9tIDQwOTYgdG8gNjU1MzYgYnl0ZXMu
Cj4+Pj4+IEkgdXNlZCBleHQ0IGZpbGVzeXN0ZW0gZm9yIHRoYXQgYmVuY2htYXJrLCB3aGljaCBz
dXBwb3J0cyA2NEtpQgo+Pj4+PiBzZWN0b3JzLgo+Pj4+Pgo+Pj4+PiBOb3RlOiBBIHNtYWxsIGNo
YW5nZSBzaG91bGQgYmUgbWFkZSBpbiBjcnlwdHNldHVwIGluIG9yZGVyIHRvIGFkZAo+Pj4+PiBz
dXBwb3J0IGZvciBzZWN0b3JzIGxhcmdlciB0aGFuIDQwOTYgYnl0ZXMuCj4+Pj4+Cj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IEl0YWkgSGFuZGxlciA8aXRhaS5oYW5kbGVyQGdtYWlsLmNvbT4KPj4+Pj4g
LS0tCj4+Pj4+IMKgwqAgZHJpdmVycy9tZC9kbS1jcnlwdC5jIHwgNiArKystLS0KPj4+Pj4gwqDC
oCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pj4+Pgo+
Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9kbS1jcnlwdC5jIGIvZHJpdmVycy9tZC9kbS1j
cnlwdC5jCj4+Pj4+IGluZGV4IDkxNmI3ZGExNmRlMi4uNzhjMjM5NDQzYmQ1IDEwMDY0NAo+Pj4+
PiAtLS0gYS9kcml2ZXJzL21kL2RtLWNyeXB0LmMKPj4+Pj4gKysrIGIvZHJpdmVycy9tZC9kbS1j
cnlwdC5jCj4+Pj4+IEBAIC0xNjgsNyArMTY4LDcgQEAgc3RydWN0IGNyeXB0X2NvbmZpZyB7Cj4+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9IGl2X2dlbl9wcml2YXRlOwo+Pj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgdTY0IGl2X29mZnNldDsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVk
IGludCBpdl9zaXplOwo+Pj4+PiAtwqDCoMKgwqDCoMKgIHVuc2lnbmVkIHNob3J0IGludCBzZWN0
b3Jfc2l6ZTsKPj4+Pj4gK8KgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgc2VjdG9yX3NpemU7Cj4+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBjaGFyIHNlY3Rvcl9zaGlmdDsKPj4+Pj4K
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHVuaW9uIHsKPj4+Pj4gQEAgLTMxMTUsOSArMzExNSw5
IEBAIHN0YXRpYyBpbnQgY3J5cHRfY3RyX29wdGlvbmFsKHN0cnVjdCBkbV90YXJnZXQKPj4+Pj4g
KnRpLCB1bnNpZ25lZCBpbnQgYXJnYywgY2hhciAqKmFyCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNjLT5jaXBoZXJfYXV0aCA9IGtzdHJk
dXAoc3ZhbCwgR0ZQX0tFUk5FTCk7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghY2MtPmNpcGhlcl9hdXRoKQo+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIC1FTk9NRU07Cj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0g
ZWxzZSBpZiAoc3NjYW5mKG9wdF9zdHJpbmcsICJzZWN0b3Jfc2l6ZTolaHUlYyIsCj4+Pj4+ICZj
Yy0+c2VjdG9yX3NpemUsICZkdW1teSkgPT0gMSkgewo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB9IGVsc2UgaWYgKHNzY2FuZihvcHRfc3RyaW5nLCAic2VjdG9yX3NpemU6JXUl
YyIsCj4+Pj4+ICZjYy0+c2VjdG9yX3NpemUsICZkdW1teSkgPT0gMSkgewo+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoY2MtPnNlY3Rv
cl9zaXplIDwgKDEgPDwgU0VDVE9SX1NISUZUKSB8fAo+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYy0+c2VjdG9yX3NpemUgPiA0MDk2
IHx8Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGNjLT5zZWN0b3Jfc2l6ZSA+IFBBR0VfU0laRSB8fAo+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChjYy0+c2VjdG9y
X3NpemUgJiAoY2MtPnNlY3Rvcl9zaXplIC0KPj4+Pj4gMSkpKSB7Cj4+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0
aS0+ZXJyb3IgPSAiSW52YWxpZCBmZWF0dXJlIHZhbHVlIGZvcgo+Pj4+PiBzZWN0b3Jfc2l6ZSI7
Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4+Pj4KPj4+Pgo+Pj4gSSBhcHByZWNp
YXRlIHlvdXIgdmFsdWFibGUgY29tbWVudHMuCj4+Pgo+Pj4gSXRhaQo+Pj4KPj4gTWlsYW4sIGNh
biB5b3UgY29tbWVudCBvbiB0aGUgYWJvdmU/Cj4KPiBIaSwKPgo+IHdlbGwsIGlmIHlvdSB3YW50
IG15IG9waW5pb24sIGxldCdzIHN1bW1hcml6ZSBpdDoKPgo+IC0geW91IHRlc3RlZCBpdCBvbiBh
IGRyaXZlciB0aGF0IGlzIHByb3ByaWV0YXJ5IGFuZCBpcyBub3QgaW4KPiB0aGUgbWFpbmxpbmUg
a2VybmVsCllvdSBhcmUgY29ycmVjdCBoZXJlLiBJIGFsc28gc3VzcGVjdCB0aGF0IHNvbWUgZHJp
dmVycyBpbiB0aGUgbWFpbmxpbmUgbWF5CmJlbmVmaXQgYXMgd2VsbCwgYnV0IEkgZGlkbid0IGhh
dmUgdGhlIG9wcG9ydHVuaXR5IHRvIHZlcmlmeSB0aGF0IHlldC4KPgo+IC0gcHJvdmlkZWQgbnVt
YmVycyBhcmUgd2l0aCB0Y3J5cHQgLSBJIHRoaW5rIHRoaXMgaXMKPiBhbiBpbnRlcm5hbCBjcnlw
dG8gQVBJIHRlc3Q7IGl0IHNheXMgbm90aGluZyBhYm91dCBwZXJmb3JtYW5jZQo+IHdpdGggeW91
ciBkbS1jcnlwdCBwYXRjaCBhYm92ZSBpdCwgcmlnaHQ/CllvdSBhcmUgY29ycmVjdC4gUGxlYXNl
IHNlZSBhZGRpdGlvbmFsIGJlbmNobWFyayByZXN1bHRzIGJlbG93Lgo+Cj4gLSBubyBudW1iZXJz
IGZvciByYW5kb20gYWNjZXNzL3NtYWxsIGZpbGUgYWNjZXNzIGhlcmUgKG5vdGUsCj4gaWYgeW91
IG5lZWQgdG8gcmVlbmNyeXB0IDY0ayBzZWN0b3IgdnMuIDRrIG9mIG1vc3RseSB1bnVzZWQgZGF0
YSwKPiBpdCBXSUxMIGhhdmUgYSBodWdlIHBlcmZvcm1hbmNlIGltcGFjdCkuCj4KPiBJTU8sIG9w
dGltaXppbmcgZm9yIGJpZyBsaW5lYXIgYWNjZXNzIGlzIGJldHRlciBvbiB0aGUgZnMgbGF5ZXIK
PiAoYW5kIGV2ZW4geWVhcnMgYWdvLCBJIG5vdGljZWQgc29tZSB2ZW5kb3IncyBwYXRjaGVzIGZv
ciBzZXR0aW5nCj4gbGFyZ2UgZnMgc2VjdG9ycyBpbiB2aWRlbyByZWNvcmRpbmcgZXF1aXBtZW50
KS4KSW50ZXJlc3RpbmcuIENhbiB5b3UgcG9pbnQgbWUgdG8gc29tZSBvZiB0aG9zZSBwYXRjaGVz
Pwo+Cj4gVGhlIHNhbWUgYXBwbGllcyB0byBlbmNyeXB0aW9uIC0gSSB0aGluayBGREUgaXMgbm90
IHRoZSBiZXN0IGxheWVyCj4gaGVyZSBpZiB5b3UgbmVlZCB0byB3b3JrIHdpdGggbGFyZ2Ugc2Vj
dG9ycyAoZW5jcnlwdGlvbiBvZiBub3QtdXNlZAo+IHNlY3RvcnMgaXMganVzdCBodWdlIHdhc3Rl
IG9mIHJlc291cmNlcyAtIGZzIGVuY3J5cHRzIG9ubHkgdXNlZCBzcGFjZSwKPiBJIGhvcGUuLi4g
OikuCj4KPiBJIHNhaWQgdGhhdCBMVUtTIG11c3QgcmVtYWluIG11bHRpcGxhdGZvcm0uIEFkZGlu
ZyBsYXJnZXIgdGhhbgo+IDRrIHNlY3RvcnMgaXMgbm90IGFuIG9wdGlvbjsgSSB3aWxsIHVuZG91
YnRlZGx5IHJlamVjdCB0aGF0IHBhdGNoCj4gaW4gY3J5cHRzZXR1cC4KPiBTbyB0aGlzIHBhdGNo
IGNhbiBiZSB1c2VkIG9ubHkgZm9yIHBsYWluIGRtLWNyeXB0IG1hcHBpbmcsCj4gd2hlcmUgeW91
IG5lZWQgdG8gaGFuZGxlIHlvdXIga2V5IG1hbmFnZW1lbnQgKHRoYXQgY291bGQgYmUgb2ssIHRo
b3VnaCkuCkluIHRoZSBmdXR1cmUgSSBwbGFuIHRvIHN1Ym1pdCBhIGNyeXB0c2V0dXAgcGF0Y2gg
dGhhdCB3aWxsIGFsbG93CmxhcmdlciBzZWN0b3JzIG9ubHkgZm9yIHRoZSBwbGFpbiBkbS1jcnlw
dCBtYXBwaW5nLiBTdWNoIGEgY2hhbmdlIHdpbGwKbm90IGFmZmVjdHRoZSBwb3J0YWJpbGl0eSBv
ZiBMVUtTLgo+Cj4gU29ycnksIGJ1dCB3aXRob3V0IGFueSBwZXJmb3JtYW5jZSBudW1iZXJzIHRo
YXQgcHJvdmUgdGhpcyByZWFsbHkKPiBoZWxwcyBhbmQgZG9lcyBub3QgY3JlYXRlIGh1Z2UgcGVy
Zm9ybWFuY2UgcHJvYmxlbXMuLi4KCkZvbGxvd2luZyBhcmUgc29tZSBiZW5jaG1hcmsgcmVzdWx0
cyB1c2luZyB0aGUgQVJNIENyeXB0b2dyYXBoaWMKRXh0ZW5zaW9ucyBDUFUgY2lwaGVyICJ4dHMo
YWVzKSIsIG9uIGFuIEFSTSBDb3J0ZXggQTUzIENQVSwKYW5kIGEgMiBUQiBTYW1zdW5nIEVWTyA5
NzAgTlZNRSBTU0Q6CgpSYW5kb20gcmVhZCwgZG0gY3J5cHQgc2VjdG9yIHNpemUgNEs6IDk2NiBN
Qi9zClJhbmRvbSByZWFkLCBkbSBjcnlwdCBzZWN0b3Igc2l6ZSA2NEs6IDEwNTQgTUIvcyAoOSUg
aW1wcm92ZW1lbnQpCgpSYW5kb20gd3JpdGUsIHNlY3RvciBzaXplIDRLOiA4NDEgTUIvcwpSYW5k
b20gd3JpdGUsIHNlY3RvciBzaXplIDY0SzogOTgzIE1CL3MgKDE2JSBpbXByb3ZlbWVudCkKCkZv
bGxvd2luZyBhcmUgY3J5cHRzZXR1cCBhbmQgZmlvIHBhcmFtZXRlcnMgdXNlZCBmb3IgdGhpcyB0
ZXN0OgpjcnlwdHNldHVwIG9wZW4gLS10eXBlIHBsYWluIC0tc2VjdG9yLXNpemUgJFNFQ1RPUl9T
SVpFIFwKwqDCoMKgIC1jICdjYXBpOnh0cyhhZXMpLXBsYWluNjQnCsKgwqDCoCAvZGV2L252bWUw
bjFwMSBkbWNyeXB0MAoKKFNFQ1RPUl9TSVpFIGlzIHNldCB0byA0MDk2IG9yIDY1NTM2KS4KCmZp
byAtLWlvZW5naW5lIHB2c3luYyAtLWZpbGVuYW1lPS9kZXYvbWFwcGVyL2RtY3J5cHQwIFwKwqDC
oMKgIC0tcmVhZHdyaXRlPSRSRUFEV1JJVEUgLS1icz02NTUzNiAtLWJsb2NrYWxpZ249NjU1MzYg
XArCoMKgwqAgLS1pb21lbV9hbGlnbj02NTUzNiAtLXRpbWVfYmFzZWQgLS1ncm91cF9yZXBvcnRp
bmcgXArCoMKgwqAgLS1ydW50aW1lPTUwIC0tZGlyZWN0PTEgLS1udW1fam9icz0zMiAtLW5hbWU9
cGxhaW4KCihSRUFEV1JJVEUgaXMgc2V0IHRvIHJhbmRyZWFkIG9yIHJhbmR3cml0ZSkKCk5vdGUg
dGhhdCBJIHN1c3BlY3QgdGhhdCB3aXRoIGNpcGhlcnMgdGhhdCB1c2UgRE1BIHdlIHdpbGwgYmUg
YWJsZSB0byBzZWUKbXVjaCBsYXJnZXIgaW1wcm92ZW1lbnQgKHNpbWlsYXJseSB0byB3aGF0IEkg
aGF2ZSByZXBvcnRlZCBpbiBteSBpbml0aWFsCnBvc3QpLCBob3dldmVyIEkgZG9uJ3QgaGF2ZSBz
dWl0YWJsZSBoYXJkd2FyZSBmb3IgdGVzdGluZyB0aGF0IGF0IHRoZQptb21lbnQuCkl0IHdvdWxk
IGJlIG5pY2UgaWYgc29tZW9uZSB3aG8gaGFzIHN1Y2ggaGFyZHdhcmUgY291bGQgdGVzdCB0aGF0
IG9yCnBvaW50IG1lIHRvIHB1YmxpY2x5IGF2YWlsYWJsZSBoYXJkd2FyZSBmb3IgYnV5aW5nIGZv
ciBzdWNoIGFuIGV4cGVyaW1lbnQuCgpOb3RlIHRoYXQgdGhpcyBiZW5jaG1hcmsgcmFuZG9tbHkg
cmVhZHMvd3JpdGVzIDY0SyBmaWxlcyB0byB0aGUgU1NELgpGb3Igc21hbGxlciB0aGFuIDY0S0Ig
ZmlsZXMsIHRoZSBwZXJmb3JtYW5jZSBpcyBpbmRlZWQgZXhwZWN0ZWQgdG8gZHJvcApzaWduaWZp
Y2FudGx5LCBob3dldmVyOgoxLiBUb2RheSB1c2VycyBjYW4gZm9ybWF0ICh1bmVuY3J5cHRlZCkg
ZXh0NCBmaWxlc3lzdGVtcyB0byA2NEsgc2VjdG9ycy4KSWYgdGhleSBzdG9yZSBzbWFsbCBmaWxl
cyBvbiBzdWNoIGZpbGVzeXN0ZW1zLCB0aGV5IHByb2JhYmx5IGFscmVhZHkKc3VmZmVyIGZyb20g
cGVyZm9ybWFuY2UgcHJvYmxlbXMuCjIuIE15IHBhdGNoIGFsbG93cyB0byB1c2UgYWxsIHNlY3Rv
ciBzaXplcyBiZXR3ZWVuIDRLIGFuZCA2NEsKKGkuZS4gNEssIDhLLCAxNkssIDMySyBhbmQgNjRL
KS4gV2hlbiB3ZSB1c2UgOEsgc2VjdG9ycywgdGhlIHBlcmZvcm1hbmNlCmRyb3AgZm9yIHNtYWxs
IGZpbGVzIGlzbid0IGV4cGVjdGVkIHRvIGJlIHNvIGhpZ2ggYW5kIHN0aWxsIEkgY2FuIHNob3cg
aW4KdGhhdCBjYXNlIGh1Z2UgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQsIGF0IGxlYXN0IHdoZW4g
dXNpbmcgbXkgcHJvcHJpZXRhcnkKY2lwaGVyIChJIG1heSBiZSBhYmxlIHRvIHNob3cgaW1wcm92
ZW1lbnQgd2l0aCBvdGhlciBoYXJkd2FyZSB3aGVuIEkKZ2V0IG15IGhhbmRzIG9uIHN1Y2ggaGFy
ZHdhcmUpLgozLiBVc2VycyBtaWdodCBiZSBhYmxlIHRvIHBhcnRpdGlvbiB0aGVpciBkaXNrIHRv
IHNldmVyYWwgcGFydGl0aW9ucywgd2l0aAp0aGUgNjRLIGJ5dGVzIHNlY3RvcnMgcGFydGl0aW9u
cyByZXNlcnZlZCBmb3IgbGFyZ2VyIGZpbGVzLgoKPgo+IE5BQ0sgZnJvbSBtZSBmb3IgdGhpcyBw
YXRjaCAoYnV0IGl0IGlzIHVwIHRvIE1pa2UgdG8gZGVjaWRlIGhlcmUpLgo+Cj4gTWlsYW4KClRo
YW5rcy4KUGxlYXNlIG5vdGUgdGhhdCBJJ2xsIGJlIG9mZi13b3JrIGZyb20gbm93IHVudGlsIG5l
eHQgVHVlc2RheS4KCkl0YWkKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRo
YXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2
ZWw=

