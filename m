Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7EA6837D8
	for <lists+dm-devel@lfdr.de>; Tue, 31 Jan 2023 21:47:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675198057;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1YaRmla/5K193LMos0fHFBZqWDm6s+jxealYMXzyyU8=;
	b=Y7bXyh40/O1QucNvut7+/yBcXube8Ta2BhPWIUdBxym0EKo9r7oU17ABefrvOD5oKB2n5B
	hXvmg8EF/mUdamliRAzyJgARleyXwVbhnARRQ91UDUCtkSnLXPGgSmd4ETMSEILlvePjgw
	ewMKdLnJju4z5egi08SJvsr5u/+Rdrc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-BLNxxMESMX6Uy1KbotixaQ-1; Tue, 31 Jan 2023 15:47:34 -0500
X-MC-Unique: BLNxxMESMX6Uy1KbotixaQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9B163810B15;
	Tue, 31 Jan 2023 20:47:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 28271492B00;
	Tue, 31 Jan 2023 20:47:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E069419465A8;
	Tue, 31 Jan 2023 20:47:25 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 40A221946587
 for <dm-devel@listman.corp.redhat.com>; Tue, 31 Jan 2023 20:47:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2CF64492B06; Tue, 31 Jan 2023 20:47:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24E2C492B05
 for <dm-devel@redhat.com>; Tue, 31 Jan 2023 20:47:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F00E387A38A
 for <dm-devel@redhat.com>; Tue, 31 Jan 2023 20:47:23 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-602-aO_p0cNIMBO57k0simU-yw-1; Tue, 31 Jan 2023 15:47:22 -0500
X-MC-Unique: aO_p0cNIMBO57k0simU-yw-1
Received: by mail-qt1-f172.google.com with SMTP id cr22so2580806qtb.10
 for <dm-devel@redhat.com>; Tue, 31 Jan 2023 12:47:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GNvDVbG7CFVraYi/TOfzOl0f+P6XVrld8Cgwy6F2tQc=;
 b=6nc9R8cyodtEDsacEO3XF0AeJHMqbnVchurpCARBOL1m5pQvBKyAfDMuy0nCIB96hH
 npHKkDcbRMy3QeLZ3vjAXu5ai6N2BUs2r3Z8ftDelVTLbKV75Ik0AMt7PAaseZUYQ6YG
 l16PrDTa/bW1SMBR4zEKLWOJbYg6LmFhluzod7enfuyCqPNhG/2uI6Y+uh5QApgPW2y+
 fT4D7NV3rLHKi8dsXeC73Dezden2AeRFIue1wG5efCuDoaNm8xmLpSi/EnIJu2QWZoPm
 22pZihQEJPstqPvluwCZTpqIg8XJRjZN9GTaTVPxzF2HKUFNGNGD8RoAAVKpm9WuanSw
 VWqg==
X-Gm-Message-State: AO0yUKWmcd88rPbc3s3Jq6gNfWyvDXGxZxP8wy5x6+EYzsjR3xowYU2q
 wk1NPvh6mL6tA9o5s6AMd6XKyqc=
X-Google-Smtp-Source: AK7set+PDMu0N8Uwh8+1p7Os6/xZFQVW0hOeiq3lGbhmrIKFFcHBzzLNY8AXEKM3pGHUO+UzcSRu3Q==
X-Received: by 2002:ac8:5f89:0:b0:3b6:2fba:3d46 with SMTP id
 j9-20020ac85f89000000b003b62fba3d46mr125295qta.42.1675198041743; 
 Tue, 31 Jan 2023 12:47:21 -0800 (PST)
Received: from localhost (pool-68-160-166-30.bstnma.fios.verizon.net.
 [68.160.166.30]) by smtp.gmail.com with ESMTPSA id
 eb10-20020a05620a480a00b007112aa42c4fsm10494479qkb.135.2023.01.31.12.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 12:47:21 -0800 (PST)
Date: Tue, 31 Jan 2023 15:47:20 -0500
From: Mike Snitzer <snitzer@kernel.org>
To: Sergei Shtepa <sergei.shtepa@veeam.com>
Message-ID: <Y9l+WIDSrVhRhPME@redhat.com>
References: <20221209142331.26395-1-sergei.shtepa@veeam.com>
 <Y8cNVv4O+vjL+aAy@redhat.com>
 <15ffd4bb-cb87-4bc9-53fc-4e0b941db0b7@veeam.com>
MIME-Version: 1.0
In-Reply-To: <15ffd4bb-cb87-4bc9-53fc-4e0b941db0b7@veeam.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [dm-devel] [PATCH v2 00/21] blksnap - block devices snapshots
 module
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
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBKYW4gMjQgMjAyMyBhdCAgNjozNFAgLTA1MDAsClNlcmdlaSBTaHRlcGEgPHNlcmdl
aS5zaHRlcGFAdmVlYW0uY29tPiB3cm90ZToKCj4gRGVhck1pa2UKPiAKPiBJIGFtIHZlcnkgZ2xh
ZCB0aGF0IHlvdSBub3RpY2VkIG15IHBhdGNoIHZlcnNpb24gMi4KPiBJJ20gc3VyZSB5b3VyIGV4
cGVyaWVuY2Ugd2lsbCBoZWxwLgo+IAo+IE9uIDEvMTcvMjMgMjI6MDQsIE1pa2UgU25pdHplciB3
cm90ZToKPiA+IFN1YmplY3Q6Cj4gPiBSZTogW1BBVENIIHYyIDAwLzIxXSBibGtzbmFwIC0gYmxv
Y2sgZGV2aWNlcyBzbmFwc2hvdHMgbW9kdWxlCj4gPiBGcm9tOgo+ID4gTWlrZSBTbml0emVyIDxz
bml0emVyQHJlZGhhdC5jb20+Cj4gPiBEYXRlOgo+ID4gMS8xNy8yMywgMjI6MDQKPiA+IAo+ID4g
VG86Cj4gPiBTZXJnZWkgU2h0ZXBhIDxzZXJnZWkuc2h0ZXBhQHZlZWFtLmNvbT4KPiA+IENDOgo+
ID4gImF4Ym9lQGtlcm5lbC5kayIgPGF4Ym9lQGtlcm5lbC5kaz4sICJjb3JiZXRAbHduLm5ldCIg
PGNvcmJldEBsd24ubmV0PiwgImxpbnV4LWJsb2NrQHZnZXIua2VybmVsLm9yZyIgPGxpbnV4LWJs
b2NrQHZnZXIua2VybmVsLm9yZz4sICJsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnIiA8bGludXgt
ZG9jQHZnZXIua2VybmVsLm9yZz4sICJsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnIiA8bGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4KPiA+IAo+ID4gCj4gPiBPbiBGcmksIERlYyAwOSAy
MDIyIGF0IDk6MjNQIC0wNTAwLAo+ID4gU2VyZ2VpIFNodGVwYSB3cm90ZToKPiA+IAo+ID4gID4g
SGkgSmVucy4gSGkgSm9uYXRoYW4uIEhpIGFsbC4KPiA+ICA+Cj4gPiAgPiBJIGFtIGhhcHB5IHRv
IG9mZmVyIGEgbW9kaWZpZWQgdmVyc2lvbiBvZiB0aGUgQmxvY2sgRGV2aWNlcyBTbmFwc2hvdHMK
PiA+ICA+IE1vZHVsZS4gSXQgYWxsb3dzIHRvIGNyZWF0ZSBub24tcGVyc2lzdGVudCBzbmFwc2hv
dHMgb2YgYW55IGJsb2NrIGRldmljZXMuCj4gPiAgPiBUaGUgbWFpbiBwdXJwb3NlIG9mIHN1Y2gg
c25hcHNob3RzIGlzIHRvIHByb3ZpZGUgYmFja3VwcyBvZiBibG9jayBkZXZpY2VzLgo+ID4gID4g
U2VlIG1vcmUgaW4gRG9jdW1lbnRhdGlvbi9ibG9jay9ibGtzbmFwLnJzdC4KPiA+ICA+Cj4gPiAg
PiBUaGUgQmxvY2sgRGV2aWNlIEZpbHRlcmluZyBNZWNoYW5pc20gaXMgYWRkZWQgdG8gdGhlIGJs
b2NrIGxheWVyLiBUaGlzCj4gPiAgPiBhbGxvd3MgdG8gYXR0YWNoIGFuZCBkZXRhY2ggYmxvY2sg
ZGV2aWNlIGZpbHRlcnMgdG8gdGhlIGJsb2NrIGxheWVyLgo+ID4gID4gRmlsdGVycyBhbGxvdyB0
byBleHRlbmQgdGhlIGZ1bmN0aW9uYWxpdHkgb2YgdGhlIGJsb2NrIGxheWVyLgo+ID4gID4gU2Vl
IG1vcmUgaW4gRG9jdW1lbnRhdGlvbi9ibG9jay9ibGtmaWx0ZXIucnN0Lgo+ID4gID4KPiA+ICA+
IEEgdG9vbCwgYSBsaWJyYXJ5IGZvciB3b3JraW5nIHdpdGggYmxrc25hcCBhbmQgdGVzdHMgY2Fu
IGJlIGZvdW5kIGF0Cj4gPiAgPiBodHRwczovL2dpdGh1Yi5jb20vdmVlYW0vYmxrc25hcC4KPiA+
ICA+Cj4gPiAgPiBUaGUgZmlyc3QgdmVyc2lvbiB3YXMgc3VnZ2VzdGVkIGF0IDEzIEp1bmUgMjAy
Mi4gTWFueSB0aGFua3MgdG8KPiA+ICA+IENocmlzdG9waCBIZWxsd2lnIGFuZCBSYW5keSBEdW5s
YXAgZm9yIHRoZSByZXZpZXcgb2YgdGhhdCB2ZXJzaW9uLgo+ID4gID4KPiA+ICA+IENoYW5nZXM6
Cj4gPiAgPiAtIEZvcmdvdHRlbiAic3RhdGljIiBkZWNsYXJhdGlvbnMgaGF2ZSBiZWVuIGFkZGVk
Lgo+ID4gID4gLSBUaGUgdGV4dCBvZiB0aGUgY29tbWVudHMgaGFzIGJlZW4gY29ycmVjdGVkLgo+
ID4gID4gLSBJdCBpcyBwb3NzaWJsZSB0byBjb25uZWN0IG9ubHkgb25lIGZpbHRlciwgc2luY2Ug
dGhlcmUgYXJlIG5vIG90aGVycyBpbgo+ID4gID4gdXBzdHJlYW0uCj4gPiAgPiAtIERvIG5vdCBo
YXZlIGFkZGl0aW9uYWwgbG9ja3MgZm9yIGF0dGFjaC9kZXRhY2ggZmlsdGVyLgo+ID4gID4gLSBi
bGtzbmFwLmggbW92ZWQgdG8gaW5jbHVkZS91YXBpLy4KPiA+ICA+IC0gI3ByYWdtYSBvbmNlIGFu
ZCBjb21tZW50ZWQgY29kZSByZW1vdmVkLgo+ID4gID4gLSB1dWlkX3QgcmVtb3ZlZCBmcm9tIHVz
ZXIgQVBJLgo+ID4gID4gLSBSZW1vdmVkIGRlZmF1bHQgdmFsdWVzIGZvciBtb2R1bGUgcGFyYW1l
dGVycyBmcm9tIHRoZSBjb25maWd1cmF0aW9uIGZpbGUuCj4gPiAgPiAtIFRoZSBkZWJ1Z2dpbmcg
Y29kZSBmb3IgdHJhY2tpbmcgbWVtb3J5IGxlYWtzIGhhcyBiZWVuIHJlbW92ZWQuCj4gPiAgPiAt
IFNpbXBsaWZpZWQgTWFrZWZpbGUuCj4gPiAgPiAtIE9wdGltaXplZCB3b3JrIHdpdGggbGFyZ2Ug
bWVtb3J5IGJ1ZmZlcnMsIENCVCB0YWJsZXMgYXJlIG5vdyBpbiB2aXJ0dWFsCj4gPiAgPiBtZW1v
cnkuCj4gPiAgPiAtIFRoZSBhbGxvY2F0aW9uIGNvZGUgb2YgbWlub3IgbnVtYmVycyBoYXMgYmVl
biBvcHRpbWl6ZWQuCj4gPiAgPiAtIFRoZSBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgc25hcHNob3Qg
aW1hZ2UgYmxvY2sgZGV2aWNlIGhhcyBiZWVuCj4gPiAgPiBzaW1wbGlmaWVkLCBub3cgaXQgaXMg
YSBiaW8tYmFzZWQgYmxvY2sgZGV2aWNlLgo+ID4gID4gLSBSZW1vdmVkIGluaXRpYWxpemF0aW9u
IG9mIGdsb2JhbCB2YXJpYWJsZXMgd2l0aCBudWxsIHZhbHVlcy4KPiA+ICA+IC0gT25seSBvbmUg
YmlvIGlzIHVzZWQgdG8gY29weSBvbmUgY2h1bmsuCj4gPiAgPiAtIENoZWNrZWQgb24gcHBjNjRs
ZS4KPiA+ICA+Cj4gPiAgPiBUaGUgdjEgdmVyc2lvbiB3YXMgc3VnZ2VzdGVkIGF0IDIgTm92ZW1i
ZXIgMjAyMi4gTWFueSB0aGFua3MgdG8gRmFiaW8KPiA+ICA+IEZhbnRvbmkgZm9yIGhpcyBmb3Ig
aGlzIHBhcnRpY2lwYXRpb24gaW4gdGhlICJibGtzbmFwIiBwcm9qZWN0IG9uIGdpdGh1Ygo+ID4g
ID4gYW5kIEpvbmF0aGFuIENvcmJldCBmb3IgaGlzIGFydGljbGUgaHR0cHM6Ly9sd24ubmV0L0Fy
dGljbGVzLzkxNDAzMS8uCj4gPiAgPiBUaGFua3MgdG8gdGhlIGltcGFydGlhbCBrZXJuZWwgdGVz
dCByb2JvdC4KPiA+ICA+Cj4gPiAgPiBDaGFuZ2VzOgo+ID4gID4gLSBBZGRlZCBkb2N1bWVudGF0
aW9uIGZvciBCbG9jayBEZXZpY2UgRmlsdGVyaW5nIE1lY2hhbmlzbS4KPiA+ICA+IC0gQWRkZWQg
ZG9jdW1lbnRhdGlvbiBmb3IgQmxvY2sgRGV2aWNlcyBTbmFwc2hvdHMgTW9kdWxlIChibGtzbmFw
KS4KPiA+ICA+IC0gVGhlIE1BSU5UQUlORVJTIGZpbGUgaGFzIGJlZW4gdXBkYXRlZC4KPiA+ICA+
IC0gT3B0aW1pemVkIHF1ZXVlIGNvZGUgZm9yIHNuYXBzaG90IGltYWdlcy4KPiA+ICA+IC0gRml4
ZWQgY29tbWVudHMsIGxvZyBtZXNzYWdlcyBhbmQgY29kZSBmb3IgYmV0dGVyIHJlYWRhYmlsaXR5
Lgo+ID4gCj4gPiBbdGhpcyByZXBseSBnb3QgbG9uZy4uLl0KPiA+IAo+ID4gSSB0aGluayBpdCBp
cyBpbXBvcnRhbnQgdG8gcmV2aXNpdCBob3cgd2UndmUgZ290dGVuIHRvIHRoaXMgcG9pbnQuCj4g
PiBUaGUgY2F0YWx5c3QgZm9yIGJsa2ZpbHRlciBhbmQgbm93IGJsa3NuYXAgd2FzIHRoYXQgSSBy
ZW1vdmVkIHRoZQo+ID4gZXhwb3J0IGZvciBibGtfbXFfc3VibWl0X2JpbyAtLSB3aGljaCB2ZWVh
bSB3YXMgdXNpbmcgZm9yIGVuYWJsZW1lbnQKPiA+IG9mIHRoZWlyIGNvbW1lcmNpYWwgYmFja3Vw
IHNvZnR3YXJlIHByb2R1Y3QsIHRoZSBvZmZlbmRpbmcgY29tbWl0IHdhcwo+ID4gNjgxY2M1ZTg2
NjdlICgiZG06IGZpeCByZXF1ZXN0LWJhc2VkIERNIHRvIG5vdCBib3VuY2UgdGhyb3VnaCBpbmRp
cmVjdCAKPiA+IGRtX3N1Ym1pdF9iaW8iKQo+ID4gCj4gPiBUaGUgd2F5IHZlZWFtIHN0YXJ0ZWQg
dG8gYWRkcmVzcyB0aGlzIGNoYW5nZSB3YXMgdG8gcmVxdWVzdCBSZWQgSGF0Cj4gPiBtb2RpZnkg
UkhFTCAoYnkgcmV2ZXJ0aW5nIG15IGNoYW5nZSBpbiBSSEVMOCwgd2hlcmVieSByZXN0b3Jpbmcg
dGhlCj4gPiBleHBvcnQpIHRvIGdpdmUgdGhlbSBhIHN0b3BnYXAgd2hpbGUgdGhleSB3b3JrZWQg
dG8gaWRlbnRpZnkgYSBtb3JlCj4gPiBsYXN0aW5nIHNvbHV0aW9uIHRvIHRoZW0gaGF2aW5nIGRl
cGVuZGVkIG9uIHN1Y2ggYSBmcmFnaWxlIGludGVyZmFjZQo+ID4gd2l0aCB3aGljaCB0byBoaWph
Y2sgSU8gZm9yIGFsbCBMaW51eCBibG9jayBkZXZpY2VzLgo+ID4gCj4gCj4gVGhhbmsgeW91IHNv
IG11Y2ggZm9yIHlvdXIgaGVscCB3aXRoIHRoZSBmdW5jdGlvbiBibGtfbXFfc3VibWl0X2Jpbygp
Lgo+IFRoaXMgZml4IGhlbHBlZCB0aGUgdmVlYW1zbmFwIG1vZHVsZSB0byBjb250aW51ZSB3b3Jr
aW5nIG9uIFJIRUwgOAo+IHdpdGggYSBtaW5pbWFsIHNldCBvZiBjcnV0Y2hlcy4gQnV0IGJlc2lk
ZXMgUkhFTCA4LCB0aGVyZSBhcmUgb3RoZXIKPiBkaXN0cmlidXRpb25zIHRoYXQgcmVxdWlyZWQg
c3VwcG9ydC4KPiAKPiBUaGUgY2F0YWx5c3Qgd2FzIHRoZSBvcHRpbWl6YXRpb24gb2YgQ2hyaXN0
b3BoIGFuZCB0aGUgcmVtb3ZhbCBvZgo+IHRoZSBtYWtlX3JlcXVlc3RfZm4oKSBjYWxsYmFjayBm
dW5jdGlvbiBpbiB2NS45LiBTZWU6Cj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgv
djUuOC4xOC9zb3VyY2UvaW5jbHVkZS9saW51eC9ibGtkZXYuaCNMNDA2Cj4gT3ZlcnJpZGluZyB0
aGlzIGZ1bmN0aW9uIGFsbG93ZWQgaGFuZGxpbmcgSS9PIHVuaXRzLgo+IAo+ID4gVGhleSB0aGVu
IGNhbWUgdXAgd2l0aCBibGstaW50ZXJwb3Nlci4gSSB0cmllZCB0byBiZSBoZWxwZnVsIGFuZAo+
ID4gcmVwbGllZCBxdWl0ZSByZWd1bGFybHkgdG8gYmxrLWludGVycG9zZXIgcGF0Y2hzZXRzLCBl
LmcuOgo+ID4gaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vYXJjaGl2ZXMvZG0tZGV2ZWwvMjAy
MS1NYXJjaC8wNDU5MDAuaHRtbAo+ID4gaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vYXJjaGl2
ZXMvZG0tZGV2ZWwvMjAyMS1NYXJjaC8wNDU4MzguaHRtbAo+ID4gKEkgd29uJ3QgZGlnIG91dCBt
b3JlIHBvaW50ZXJzLCBidXQgY2FuIGlmIHlvdSBkb3VidCB0aGlzIGFzc2VydGlvbikuCj4gPiBU
aGUgbGFzdCByZXBseSBJIGdvdCBvbiB0aGlzIHRvcGljIHdhcyB2ZXJ5IGRlbnNlIGFuZCBzbyBJ
Cj4gPiB0YWJsZWQgaXQgd2l0aCB0aGUgaWRlYSBvZiByZXZpc2l0aW5nIGl0LiBCdXQgSSBkcm9w
cGVkIHRoZSBiYWxsIGFuZAo+ID4gbmV2ZXIgZGlkIHJlcGx5IHRvIHRoaXM6Cj4gPiBodHRwczov
L2xpc3RtYW4ucmVkaGF0LmNvbS9hcmNoaXZlcy9kbS1kZXZlbC8yMDIxLUFwcmlsLzA0NjE4NC5o
dG1sCj4gPiAKPiA+IFNvcnJ5LiBCdXQgdGhhdCB3YXNuJ3Qgb3V0IG9mIG1hbGljZS4gSSB3YXMg
anVzdCBidXN5IHdpdGggb3RoZXIKPiA+IHRoaW5ncyBhbmQgYmxrLWludGVycG9zZXIgdG9vayB0
aGUgYmFjayBzZWF0LiBJIG5ldmVyIGltYWdpbmVkIHRoYXQgbXkKPiA+IGluYWN0aW9uIHdvdWxk
IGZvc3RlciBjb21wbGV0ZWx5IGFiYW5kb25pbmcgdGhlIGFwcHJvYWNoLgo+ID4gCj4gCj4gQW5k
IHllcywgSeKAmXZlIHNwZW50IHNldmVyYWwgbW9udGhzIHRyeWluZyB0byByZWZpbmUgdGhlIERN
IGluIG9yZGVyIHRvCj4gaW1wbGVtZW50IHRoZSBmZWF0dXJlIG9mIGF0dGFjaGluZyBETSBkZXZp
Y2VzIG9uIHRoZSBmbHksIHRoYXQgeW91IHNhaWQgeW91Cj4gd291bGQgbGlrZSB0byBoYXZlIGlu
IERNLiBBbGFzLCBJIGhhdmUgbm90IGFjaGlldmVkIHN1Y2Nlc3MuIEkgZmlndXJlZCB0aGF0Cj4g
aXQgd291bGQgdGFrZSBhIGxvdCBvZiBjaGFuZ2VzIGluIHRoZSBETSBjb2RlIGJlZm9yZSBpdHMg
bm9uLXBlcnNpc3RlbnQKPiBzbmFwc2hvdHMgY2FuIGJlIHVzZWQgZm9yIGJhY2t1cCwgYW5kIHNv
bWUgYXJjaGl0ZWN0dXJhbCBjaGFuZ2VzIHdpbGwgYmUKPiByZXF1aXJlZC4gQWx0aG91Z2ggeW91
IGhhdmUgYmVlbiB2ZXJ5IGhlbHBmdWwgZm9yIGEgd2hpbGUsIGF0IHNvbWUgcG9pbnQKPiB5b3Ug
c3RvcHBlZCBwcm92aWRpbmcgYW55IGZlZWRiYWNrIGFuZCB0aHVzIEkgc3RhcnRlZCB0byBleHBs
b3JlIG90aGVyCj4gcG9zc2liaWxpdGllcyB0byBzb2x2ZSB0aGUgcHJvYmxlbS4KPiAKPiBTZWVp
bmcgeW91ciBhbm5veWFuY2Ugbm93LCBJIHdvbmRlciB3aGF0IHdvdWxkIGJlIHRoZSBiZXR0ZXIg
d2F5IHRvIGNvbnRpbnVlCj4gbXkgd29yayBpbiB0aGUgZ2l2ZW4gY2lyY3Vtc3RhbmNlcz8gV2hh
dCBraW5kIG9mIGFjdGlvbiB3b3VsZCB5b3UgZXhwZWN0IGZyb20KPiBtZSBpbiBzdWNoIHNpdHVh
dGlvbj8gQmVpbmcgbGVmdCB3aXRob3V0IGFueSBmZWVkYmFjayBhbmQgZ3VpZGFuY2Ugb24gRE0s
Cj4gSSBkZWNpZGVkIHRvIHdvcmsgZGlyZWN0bHkgd2l0aCB0aGUgY29tbXVuaXR5IHRvIGZpbmQg
YmV0dGVyIHNvbHV0aW9uLgo+IAo+IFRoYXQgaXMsIEkgdG9vayBhbm90aGVyIHJvdXRlIChibGtz
bmFwKSBub3QgYmVjYXVzZSBJIHRob3VnaHQgdGhlIGluaXRpYWwgCj4gRE0tYmFzZWQgYXBwcm9h
Y2ggcHJvcG9zZWQgYnkgeW91IHdhcyBpbmZlcmlvciBvciBiYWQsIGJ1dCBiZWNhdXNlIG9ubHkg
dGhpcwo+IGRpcmVjdGlvbiByZW1haW5lZCBhdmFpbGFibGUgdG8gbWUuCgpJJ20gbGF0ZSB0byBy
ZXNwb25kIHRvIHlvdXIgZW1haWwgYWdhaW4gYmVjYXVzZSBSZWQgSGF0IG5vdyBpbXBvc2VzCmdt
YWlsIGFuZCBpdHMgbWFpbCBmaWx0ZXJpbmcgaXMgYWJ5c21hbC4gSSBzaG91bGQganVzdCB1c2UK
c25pdHplckBrZXJuZWwub3JnIHNpbmNlIGl0IGlzIGFibGUgdG8gZW5zdXJlIEkgYW0gYXdhcmUg
b2YKcmVwbGllcy4uIGFueXdheSwgdGhhdCdzIG15IHByb2JsZW0gdG8gc29ydCBvdXQhIDspCgpZ
b3UncmUgZmluZSB0byBhcHByb2FjaCB0aGUgaW1wbGVtZW50YXRpb24gaG93ZXZlciB5b3UgYW5k
IG90aGVycwp0aGluayBiZXN0LiAgSSBoYXZlIGEgY291cGxlIGNvcmUgcG9pbnRzIEknbGwgcmFp
c2UgaW4gdGhlIGJsb2NrIGNvcmUKcGF0Y2guCgpCdXQgeWVzLCBJIHdhcyBob3Bpbmcgd2UgY291
bGQgZWZmZWN0aXZlbHkgbWFrZSBpdCBzbyB0aGF0IGFueSBibG9jawpkZXZpY2UgY291bGQgYmUg
YXVnbWVudGVkIHRvIHJlbWFwIGJpb3MgKGVpdGhlciBpbiB0ZXJtcyBvZiBleGlzdGluZwpETSB0
YXJnZXRzIG9yIGEgbW9yZSBtaW5pbWFsaXN0IGFwcHJvYWNoIHRoYXQgbWVldHMgeW91ciBzbmFw
c2hvdApuZWVkcykuCgpGZWVscyBzb21ld2hhdCBsaWtlIGZhaWx1cmUgdG8gbm90IGJlIGFibGUg
dG8gbWFrZSB0aGF0IGFkdmFuY2VtZW50LApidXQgbm90aGluZyBpcyAiZG9uZSIgeWV0Li4uIGxl
dCdzIHNlZSB3aGF0IHdlIGNhbiBkby4KCj4gPiBCdXQgbXkgdGhhbmtzIGlzIEknbSBub3cgbWFk
ZSB0byBkZWZlbmQgbXlzZWxmIG9uIExXTjoKPiA+IGh0dHBzOi8vbHduLm5ldC9BcnRpY2xlcy85
MjAyNDUvCj4gPiBodHRwczovL2x3bi5uZXQvQXJ0aWNsZXMvOTIwMjQ5Lwo+ID4gCj4gPiBJIGhh
cHBlbmVkIHRvIHRyaXAgb3ZlciB0aGF0IExXTiB0aHJlYWQgYmVjYXVzZSBJIHNhdyBIYW5uZXMg
cmVmZXJlbmNlCj4gPiAiYmxrc25hcCIgYXMgc29tZXRoaW5nIHRoYXQgc29tZWhvdyBpcyBhIHRv
bGVyYXRlZCBhZHZhbmNlIGJ1dCBvdGhlcgo+ID4gZWZmb3J0cyBhcmUgbm90Ogo+ID4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYmxvY2svMDZlNGQwM2MtM2VjZi03ZTkxLWI4MGUtNjYw
MGIzNjE4Yjk4QHN1c2UuZGUvCj4gPiAKPiA+IGJsa3NuYXAgcmVhbGx5IG5lZWRzIHRvIHN0YW5k
IG9uIGl0cyBvd24gbWVyaXRzIGFuZCBpdCBjb3VsZCBiZSB0aGF0Cj4gPiBpbiBjb25qdW5jdGlv
biB3aXRoIGJsa2ZpbHRlciBpdCBkb2VzLiBCdXQgdGhlIHdheSBpdCBoYXMgZXZvbHZlZCBoYXMK
PiA+IGJlZW4gYW50aXRoZXRpY2FsIHRvIGhvdyB0byBwcm9wZXJseSBlbmdhZ2UgdGhlIExpbnV4
IGNvbW11bml0eSBhbmQKPiA+IHN1YnN5c3RlbSBtYWluYXRpbmVycyBsaWtlIG15c2VsZi4gVGhl
IFBSIGNhbXBhaWduIHRvIHJhaXNlIGF3YXJlbmVzcwo+ID4gd2l0aCBMV04gYmVjYW1lIG1vcmUg
aW1wb3J0YW50IHRoYW4gY2MnaW5nIG1lLiBUaGF0IHNheXMgaXQgYWxsCj4gPiByZWFsbHkuCj4g
PiAKPiAKPiBBcyBmb3IgdGhlIGFydGljbGUgb24gTFdOOgo+IAo+IEkgYW0gdmVyeSBncmF0ZWZ1
bCB0byBKb25hdGhhbiBmb3IgaGlzIGFydGljbGUuIEl0IGF0dHJhY3Qgc29tZSBhdHRlbnRpb24K
PiB0byBteSB3b3JrLiBIb3dldmVyLCBpdOKAmXMgd2FzbuKAmXQgYSBkZWxpYmVyYXRlIFBSIGNv
bXBhbnkgZnJvbSBWZWVhbS4KPiBJbiBmYWN0LCBWZWVhbSBoYXMgbm90aGluZyB0byBkbyB3aXRo
IHRoZSBhcnRpY2xlLgo+IAo+IFllcywgSSB3b3JrIGZvciB0aGUgY29tcGFueSwgYnV0IHRoZSBj
b21wYW55IGhhcyBuZWl0aGVyIHJlcXVlc3RlZCB0aGUKPiBhcnRpY2xlLCBub3IgaGFzIHN0YXJ0
ZWQgYW55IG90aGVyIFBSIHJlZ2FyZGluZyB0aGUgbWF0dGVyLgo+IAo+IElmIEkgd2VyZSBvcmdh
bml6aW5nIGEgUFIgY2FtcGFpZ24sIHRoZSBhcnRpY2xlIHdvdWxkIGJlIHNpbWlsYXIgdG8gdGhp
czoKPiBodHRwczovL2dpdGh1Yi5jb20vdmVlYW0vYmxrc25hcC9ibG9iL21hc3Rlci9kb2MvU29t
ZXRoaW5nLXdyb25nLXdpdGgtc25hcHNob3RzLWZvci1MaW51eC5tZAo+IEJ1dCBiZSBjYXJlZnVs
ISBJbiB0aGUgYXJ0aWNsZSBJIHRyeSB0byBjaGFuZ2UgdGhlIHJlYWRlcidzIG9waW5pb24gYWJv
dXQKPiBzbmFwc2hvdHMuIEZlZWRiYWNrLCBhcyB1c3VhbCwgaXMgd2VsY29tZS4KCldlIGNhbiBq
dXN0IG1vdmUgcGFzdCBhbGwgdGhhdC4gTm8gbGFzdGluZyBpc3N1ZS4gSSB0b29rIHRoZSBjb21t
ZW50cwphYm91dCBETSBpbiB0aGF0IGx3biBhcnRpY2xlIHRvbyBwZXJzb25hbC4KCj4gPiBCdXQg
aG9wZWZ1bGx5IHlvdSBjYW4gdGFrZSBteSB3b3JkcyBhcyBteSB0cnV0aDogSSB0aGluayB3aGF0
IHlvdSdyZQo+ID4gd2FudGluZyB0byBkbyBpcyB1c2VmdWwuIEkgbmV2ZXIgaW50ZW5kZWQgdG8g
YWN0IGFzIHNvbWUgZ2F0ZWtlZXBlci4gSQo+ID4gZG9uJ3QgaGF2ZSBhIHByb2JsZW0gd2l0aCB3
aGF0IHlvdXIgZ29hbHMgYXJlLCBJIGp1c3QgYXNrIHRoYXQgX2hvd18KPiA+IHlvdSBhY2hpZXZl
IHlvdXIgZ29hbHMgYmUgZG9uZSB3aXRoIGNhcmUgYW5kIGNvbnNpZGVyYXRpb24gKHRoZQo+ID4g
YXR0ZW1wdHMgSSByZXZpZXdlZCBwcmlvciB0byB5b3VyIG1vc3QgcmVjZW50IHdvcmsgd2VyZSBs
YWNraW5nKS4KPiA+IAo+IAo+IE1pa2UsIEkgYXNzdXJlIHlvdSwgSSBoYXZlIG9uZSBnb2FsLiBT
bmFwc2hvdHMgb2YgYmxvY2sgZGV2aWNlcyBpbiB0aGUKPiBMaW51eCBrZXJuZWwgZm9yIGJhY2t1
cC4KPgo+IEkgdGhpbmsgd2UgZ290IG9mZiB0byBhIGdvb2Qgc3RhcnQgaW5pdGlhbGx5LCBidXQg
dGhlbiBzb21ldGhpbmcgd2VudCB3cm9uZyAKPiAobWlzY29tbXVuaWNhdGlvbnMsIG1pc3VuZGVy
c3RhbmRpbmcsIGFuZCBhIGxhY2sgb2YgdGltZSkgc28gaGVyZSB3ZSBhcmUuCj4gSWYgeW91IGNv
dWxkIGNsYXJpZnkgd2hhdCBjb3VsZCBoYXZlIGJlZW4gdGhlIHByb3BlciB3YXkgb2YgZGVhbGlu
ZyB3aXRoCj4gdGhhdCBzaXR1YXRpb24gZnJvbSBteSBzaWRlLCBJIHdvdWxkIHJlYWxseSBhcHBy
ZWNpYXRlIHRoYXQuCgpJIHdpbGwgaGF2ZSB0byBsb29rIGNsb3NlciBhdCBob3cgeW91J3JlIGFi
bGUgdG8gZW5zdXJlIGNvbnNpc3RlbmN5CmJldHdlZW4gdXBwZXIgbGF5ZXIgKEZTKSBhbmQgdGhl
IGJsb2NrIGxheWVyLiAgVGhlIGZzZnJlZXplIGhvb2tzIHdlcmUKYWRkZWQgbG9uZyBhZ28gd2l0
aCBGUy10by1ibG9jayBjb25zaXN0ZW5jeSAoZW5zdXJpbmcgSU8gZmx1c2hlZCBhbmQKaGFsdGVk
LCBldGMpLgogCj4gPiBCdXQgbXkgb25lIGFuZCBvbmx5IHJlcXVlc3QgZm9yIHRoaXMgbGluZSBv
ZiBkZXZlbG9wbWVudCB3b3VsZCBiZTogSQo+ID4gX3JlYWxseV8gd2FudCBETSBjb2RlIHRvIGJl
IGFibGUgdG8gdXNlZCBhcyBhbiBlbmRwb2ludCBmb3IgSU8KPiA+IHJlbWFwcGluZyBhc3NvY2lh
dGVkIHdpdGggYW55IG5ldyBibG9jayBjb3JlIGhvb2sgYWRkZWQgdG8gYWNjb21wbGlzaAo+ID4g
ZHluYW1pYyByZW1hcHBpbmcgb2YgSU8uIElmIEkgbmVlZCB0byB0YWtlIGFuIGFjdGl2ZSByb2xl
IGluIHRoZQo+ID4gZGV2ZWxvcG1lbnQgb2YgdGhhdCBjYXBhYmlsaXR5LCBzbyBiZSBpdC4KPiA+
IAo+IAo+IEkgYW0gc3VyZSB0aGF0IHRoaXMgaXMgcXVpdGUgYWNoaWV2YWJsZS4gSWYgdGhlIGRt
LWRldiB0ZWFtIGhhcyBzcGVjaWFsCj4gbmVlZHMgd2hlbiBhdHRhY2hpbmcgRE0gZGV2aWNlcyB2
aWEgYmxrZmlsdGVyLCB3ZSB3aWxsIGJlIGFibGUgdG8gdXBncmFkZSBpdC4KPiBBdCB0aGUgbW9t
ZW50IEkgZG9uJ3Qgc2VlIGFueSBwcm9ibGVtcyB3aXRoIHRoaXMuCj4gSSBjYW4gcHJvbWlzZSB5
b3UgdG8gYWRkIHlvdSB0byDQodChIHdoZW4gc2VuZGluZyBuZXh0IHBhdGNoZXMuCj4gCj4gU291
bmRzIGdvb2Q/CgpTdXJlLgoKPiA+IEkndmUgeWV0IHRvIGxvb2sgY2xvc2VseSBhdCBhbGwgdGhp
cyBjb2RlIChidXQgd293IHRoZXJlIGlzIHF1aXRlIGEKPiA+IGxvdCB1bmRlciBkcml2ZXJzL2Js
b2NrL2Jsa3NuYXApLiBJJ2xsIGhhdmUgYSBsb29rIGF0IHRoZSBibG9jay1jb3JlCj4gPiBjaGFu
Z2VzIGFuZCB0aGVuIHRyeSB0byBtYWtlIHNlbnNlIG9mIHRoaW5ncyBmcm9tIHRoZXJlLgo+ID4K
PiAKPiBZZXMsIHRoYXQncyByaWdodC4gVGhlcmUgYXJlIHF1aXRlIGEgZmV3IGNoYW5nZXMgaW4g
YmxvY2stY29yZS4KPiBGcm9tIHRoZSBibGtzbmFwLCBpdCBpcyBlbm91Z2ggdG8gdmlldyB0cmFj
a2VyLmMuIEkvTyBoYW5kbGluZyBpcwo+IGltcGxlbWVudGVkIHRoZXJlLgo+IEJ1dCBpdCdzIHBy
b2JhYmx5IGJldHRlciB0byB3YWl0IGZvciB0aGUgbmV4dCB2ZXJzaW9uIG9mIHBhdGNoIHRoYXQg
dGFrZXMKPiBpbnRvIGFjY291bnQgQ2hyaXN0b3BoJ3MgY29tbWVudHMuIFRoZXJlIGFyZSBhIGxv
dCBvZiBjaGFuZ2VzLCBhbmQgZmlyc3QKPiBvZiBhbGwgaW4gdGhlIGludGVyZmFjZS4KCk9LLCBJ
J2xsIHN0aWxsIHJlcGx5IHRvIHRoZSBibG9jayBjb3JlIHBhdGNoIG5vdy1pc2guCgo+ID4gQnV0
IHlvdSd2ZSBhbHJlYWR5IGJ5cGFzc2VkIG1lLCBteSBob3BlIGlzIHRoYXQgSmVucyBhbmQgQ2hy
aXN0b3BoCj4gPiBhZ3JlZSB0aGF0IHdlIG5lZWQgdGhpcyBsaW5lIG9mIGRldmVsb3BtZW50IHRv
IGJlIGluIHNlcnZpY2UgdG8gb3RoZXIKPiA+IGFyZWFzIG9mIHRoZSBMaW51eCBibG9jayBzdWJz
eXN0ZW0gYW5kIGl0cyBkcml2ZXJzIHRoYXQgd2VyZQo+ID4gZXN0YWJsaXNoZWQgZm9yIHRoZSBw
dXJwb3NlcyBvZiByZW1hcHBpbmcgSU8uIEl0IGNhbm5vdCBqdXN0IGJlCj4gPiB0aGUgc3Vic2V0
IG5lZWRlZCB0byBjZW1lbnQgdmVlYW0ncyBhYmlsaXR5IHRvIHVzZSBMaW51eCBmb3IgaXRzCj4g
PiBwdXJwb3NlcyAoYnV0IEkgY29tcGxldGVseSB1bmRlcnN0YW5kIHRoYXQgaXMgdGhlIHBvaW50
IG9mIHZlZWFtJ3MKPiA+IGV4ZXJjaXNlKS4KPiAKPiBJdOKAmXMgbm90IGFib3V0IFZlZWFtIGF0
IGFsbC4gSSBhbSBzdXJlIHRoYXQgbXkgd29yayB3aWxsIGhlbHAgbWFueSBiYWNrdXAgCj4gdmVu
ZG9ycyBhbmQgYXZlcmFnZSB1c2VycyB0byBidWlsZCBtb3JlIHJvYnVzdCBhbmQgZWZmaWNpZW50
IGJhY2t1cCB0b29scy4KPiBTbywgdGhlIGFyZ3VtZW50IHRoYXQgSSBkbyBpdCBqdXN0IGJlY2F1
c2UgVmVlYW0gbmVlZHMgaXQgZG9lcyBub3QgaG9sZAo+IGFueSB3YXRlciDigJMgSSBrbm93IHRo
YXQgbWFueSBwZW9wbGUgbmVlZCB0aGUgZmVhdHVyZSwgbm90IGp1c3QgVmVlYW0uCgpObyBvdGhl
ciBzbmFwc2hvdCBjb25zdW1lcnMgaGF2ZSBzaG93biB0aGVtc2VsdmVzLiBVc2luZyB0aGVtIGFz
IHNvbWUKc29ydCBvZiBpbXBsaWVkIGNvbnNlbnN1cyBvbiB3aGF0IGlzIG5lZWRlZCBmb3IgZ2Vu
ZXJpYyBMaW51eCBzbmFwc2hvdAppcyBhIGJpdCBvZiBhIGxlYXAuIEFsbCB5b3UgcmVhbGx5IGhh
dmUgYXJlIHlvdXIgcmVxdWlyZW1lbnRzLiBEb2Vzbid0CnJlYWxseSBoZWxwIHRvIHNheSB5b3Ug
cmVwcmVzZW50IHRoZSBpbnRlcmVzdHMgb2YgYWxsIGludGVyZXN0ZWQKcGFydGllcyBpZiB0aGV5
IHJlbWFpbiBuYW1lbGVzcyBhbmQgaW4gdGhlIGJhY2tncm91bmQuCgpNaWtlCgotLQpkbS1kZXZl
bCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVsCg==

