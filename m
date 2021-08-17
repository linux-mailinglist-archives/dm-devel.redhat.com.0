Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 64E723EF56E
	for <lists+dm-devel@lfdr.de>; Wed, 18 Aug 2021 00:07:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-GFhZ02tYME2xI-fhiDvWkA-1; Tue, 17 Aug 2021 18:07:21 -0400
X-MC-Unique: GFhZ02tYME2xI-fhiDvWkA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 070491008060;
	Tue, 17 Aug 2021 22:07:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2E915C1D5;
	Tue, 17 Aug 2021 22:07:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C704D181A0F7;
	Tue, 17 Aug 2021 22:07:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17HM6ncJ026519 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 17 Aug 2021 18:06:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3CFA8DA682; Tue, 17 Aug 2021 22:06:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37A4EDA685
	for <dm-devel@redhat.com>; Tue, 17 Aug 2021 22:06:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEF6F8007BB
	for <dm-devel@redhat.com>; Tue, 17 Aug 2021 22:06:45 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-186-tDTE5u2xNyS44ICPkV6uxw-1; Tue, 17 Aug 2021 18:06:41 -0400
X-MC-Unique: tDTE5u2xNyS44ICPkV6uxw-1
Received: by mail-pf1-f180.google.com with SMTP id 18so125656pfh.9;
	Tue, 17 Aug 2021 15:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=d1NvDBzspxxyRi/JU6mkO/Y9RX6b8XmFBQ7KZDZMOrI=;
	b=WQshsA8ovRgPwQCnjc999BkNb+iUHMpQmjLeH94keVxBPlJhuo4n9ZCLq0SDrI3JqC
	ipz0iKO9s73SRQfGJHOm9h7zVCHIwhpbSUxt47AeGMcpOqtaB6ddUv7vLSV0y0xxPDxh
	YjK857HyWmh92yzgf0kMHitf068gHaAU7PbMo7WJdNHrhmzyvkqKDYRbPiQcsh8KVo9c
	XfXhxr3COPXpF1SxOWaa182pKSG7vx/xufeShEEAp9mVUwR9mPY8n+iN+MmmOfmKlbHF
	tgzc+ywVWJfRAaJseN3eKrevp74+DEt5xXLuS0crdh5SjALgUTTtP21sp3Z7BLLveIlT
	mzaQ==
X-Gm-Message-State: AOAM533SVYIh2Ry/k+6pmMwi7FWLjznTOWxCj6MWqRgo6Ud8VqjxAruA
	nzK0otzOnUwnWMS3nDJHJ5c=
X-Google-Smtp-Source: ABdhPJw7LqAAu3ADrUe4x5xcX+IpGVCRdOJivZhoDJHTeIj8/NmXs+jjll6YxWczOsAmKfPaM7OZQQ==
X-Received: by 2002:a05:6a00:884:b029:346:8678:ce15 with SMTP id
	q4-20020a056a000884b02903468678ce15mr5735112pfj.75.1629237999882;
	Tue, 17 Aug 2021 15:06:39 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
	([2620:15c:211:201:ae3f:1e44:e6d0:4a44])
	by smtp.gmail.com with ESMTPSA id y5sm4244890pgs.27.2021.08.17.15.06.37
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 17 Aug 2021 15:06:39 -0700 (PDT)
To: dgilbert@interlog.com, Mikulas Patocka <mpatocka@redhat.com>
References: <20210817101423.12367-1-selvakuma.s1@samsung.com>
	<CGME20210817101758epcas5p1ec353b3838d64654e69488229256d9eb@epcas5p1.samsung.com>
	<20210817101423.12367-4-selvakuma.s1@samsung.com>
	<ad3561b9-775d-dd4d-0d92-6343440b1f8f@acm.org>
	<alpine.LRH.2.02.2108171630120.30363@file01.intranet.prod.int.rdu2.redhat.com>
	<bbecc7e7-8bf5-3fe3-6c24-883c79fb7517@interlog.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <53b14381-101f-209b-382c-67d88af9647d@acm.org>
Date: Tue, 17 Aug 2021 15:06:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <bbecc7e7-8bf5-3fe3-6c24-883c79fb7517@interlog.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	djwong@kernel.org, linux-nvme@lists.infradead.org,
	dm-devel@redhat.com, hch@lst.de, agk@redhat.com,
	linux-scsi@vger.kernel.org, nitheshshetty@gmail.com,
	willy@infradead.org, nj.shetty@samsung.com, kch@kernel.org,
	SelvaKumar S <selvakuma.s1@samsung.com>, selvajove@gmail.com,
	linux-block@vger.kernel.org, javier.gonz@samsung.com,
	kbusch@kernel.org, axboe@kernel.dk, damien.lemoal@wdc.com,
	joshi.k@samsung.com, "Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-api@vger.kernel.org, johannes.thumshirn@wdc.com,
	linux-fsdevel@vger.kernel.org, joshiiitr@gmail.com, asml.silence@gmail.com
Subject: Re: [dm-devel] [PATCH 3/7] block: copy offload support
	infrastructure
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gOC8xNy8yMSAyOjUzIFBNLCBEb3VnbGFzIEdpbGJlcnQgd3JvdGU6Cj4gT24gMjAyMS0wOC0x
NyA0OjQxIHAubS4sIE1pa3VsYXMgUGF0b2NrYSB3cm90ZToKPj4gT24gVHVlLCAxNyBBdWcgMjAy
MSwgQmFydCBWYW4gQXNzY2hlIHdyb3RlOgo+Pj4gT24gOC8xNy8yMSAzOjE0IEFNLCBTZWx2YUt1
bWFyIFMgd3JvdGU6Cj4+Pj4gSW50cm9kdWNlIFJFUV9PUF9DT1BZLCBhIG5vLW1lcmdlIGNvcHkg
b2ZmbG9hZCBvcGVyYXRpb24uIENyZWF0ZQo+Pj4+IGJpbyB3aXRoIGNvbnRyb2wgaW5mb3JtYXRp
b24gYXMgcGF5bG9hZCBhbmQgc3VibWl0IHRvIHRoZSBkZXZpY2UuCj4+Pj4gTGFyZ2VyIGNvcHkg
b3BlcmF0aW9uIG1heSBiZSBkaXZpZGVkIGlmIG5lY2Vzc2FyeSBieSBsb29raW5nIGF0IGRldmlj
ZQo+Pj4+IGxpbWl0cy4gUkVRX09QX0NPUFkoMTkpIGlzIGEgd3JpdGUgb3AgYW5kIHRha2VzIHpv
bmVfd3JpdGVfbG9jayB3aGVuCj4+Pj4gc3VibWl0dGVkIHRvIHpvbmVkIGRldmljZS4KPj4+PiBO
YXRpdmUgY29weSBvZmZsb2FkIGlzIG5vdCBzdXBwb3J0ZWQgZm9yIHN0YWNrZWQgZGV2aWNlcy4K
Pj4+Cj4+PiBVc2luZyBhIHNpbmdsZSBvcGVyYXRpb24gZm9yIGNvcHktb2ZmbG9hZGluZyBpbnN0
ZWFkIG9mIHNlcGFyYXRlIAo+Pj4gb3BlcmF0aW9ucwo+Pj4gZm9yIHJlYWRpbmcgYW5kIHdyaXRp
bmcgaXMgZnVuZGFtZW50YWxseSBpbmNvbXBhdGlibGUgd2l0aCB0aGUgZGV2aWNlIAo+Pj4gbWFw
cGVyLgo+Pj4gSSB0aGluayB3ZSBuZWVkIGEgY29weS1vZmZsb2FkaW5nIGltcGxlbWVudGF0aW9u
IHRoYXQgaXMgY29tcGF0aWJsZSAKPj4+IHdpdGggdGhlCj4+PiBkZXZpY2UgbWFwcGVyLgo+Pgo+
PiBJIG9uY2Ugd3JvdGUgYSBjb3B5IG9mZmxvYWQgaW1wbGVtZW50YXRpb24gdGhhdCBpcyBjb21w
YXRpYmxlIHdpdGggZGV2aWNlCj4+IG1hcHBlci4gVGhlIGNvcHkgb3BlcmF0aW9uIGNyZWF0ZXMg
dHdvIGJpb3MgKG9uZSBmb3IgcmVhZGluZyBhbmQgb25lIGZvcgo+PiB3cml0aW5nKSwgcGFzc2Vz
IHRoZW0gaW5kZXBlbmRlbnRseSB0aHJvdWdoIGRldmljZSBtYXBwZXIgYW5kIHBhaXJzIHRoZW0K
Pj4gYXQgdGhlIHBoeXNpY2FsIGRldmljZSBkcml2ZXIuCj4+Cj4+IEl0J3MgaGVyZTogCj4+IGh0
dHA6Ly9wZW9wbGUucmVkaGF0LmNvbS9+bXBhdG9ja2EvcGF0Y2hlcy9rZXJuZWwveGNvcHkvY3Vy
cmVudAo+IAo+IEluIG15IGNvcHkgc29sdXRpb24gdGhlIHJlYWQtc2lkZSBhbmQgd3JpdGUtc2lk
ZSBiaW8gcGFpcnMgc2hhcmUgdGhlIAo+IHNhbWUgc3RvcmFnZSAoaS5lLiByYW0pIFRoaXMgZ2V0
cyBhcm91bmQgdGhlIG5lZWQgdG8gY29weSBkYXRhIGJldHdlZW4gCj4gdGhlIGJpb19zLgo+IFNl
ZToKPiAgwqDCoCBodHRwczovL3NnLmRhbm55LmN6L3NnL3NnX3Y0MC5odG1sCj4gaW4gU2VjdGlv
biA4IG9uIFJlcXVlc3Qgc2hhcmluZy4gVGhpcyB0ZWNobmlxdWUgY2FuIGJlIGVmZmljaWVudGx5
IAo+IGV4dGVuZCB0bwo+IHNvdXJjZSAtLT4gZGVzdGluYXRpb24xLGRlc3RpbmF0aW9uMiwuLi7C
oMKgwqDCoMKgIGNvcGllcy4KPiAKPiBEb3VnIEdpbGJlcnQKPiAKPj4gSSB2ZXJpZmllZCB0aGF0
IGl0IHdvcmtzIHdpdGggaVNDU0kuIFdvdWxkIHlvdSBiZSBpbnRlcmVzdGVkIGluIAo+PiBjb250
aW51aW5nCj4+IHRoaXMgd29yaz8KCkhpIE1pa3VsYXMgYW5kIERvdWcsCgpZZXMsIEknbSBpbnRl
cmVzdGVkIGluIGNvbnRpbnVpbmcgTWlrdWxhcycgd29yayBvbiBjb3B5IG9mZmxvYWRpbmcuIEkg
CndpbGwgdGFrZSBhIGxvb2sgYXQgRG91ZydzIGFwcHJvYWNoIHRvbyBmb3Igc2hhcmluZyBidWZm
ZXJzIGJldHdlZW4gCnJlYWQtc2lkZSBhbmQgd3JpdGUtc2lkZSBiaW9zLiBJdCBtYXkgdGFrZSBh
IGZldyBtb250aHMgaG93ZXZlciBiZWZvcmUgSSAKY2FuIGZpbmQgdGhlIHRpbWUgdG8gd29yayBv
biB0aGlzLgoKVGhhbmtzLAoKQmFydC4KCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZl
bEByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8v
ZG0tZGV2ZWw=

