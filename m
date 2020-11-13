Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7328C2B3FFF
	for <lists+dm-devel@lfdr.de>; Mon, 16 Nov 2020 10:40:37 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-QJ44rdDeP_6ZC4GU82_9xA-1; Mon, 16 Nov 2020 04:40:34 -0500
X-MC-Unique: QJ44rdDeP_6ZC4GU82_9xA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5F2D804B9F;
	Mon, 16 Nov 2020 09:39:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A172260E3A;
	Mon, 16 Nov 2020 09:39:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A6E458121;
	Mon, 16 Nov 2020 09:39:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ADHNOOl001287 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 13 Nov 2020 12:23:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4D290110E88; Fri, 13 Nov 2020 17:23:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4775A110E8B
	for <dm-devel@redhat.com>; Fri, 13 Nov 2020 17:23:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA10A185A790
	for <dm-devel@redhat.com>; Fri, 13 Nov 2020 17:23:20 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-419-ZBHK1uaYP96mNMoGaqiCHg-1;
	Fri, 13 Nov 2020 12:23:17 -0500
X-MC-Unique: ZBHK1uaYP96mNMoGaqiCHg-1
Received: from [192.168.86.31] (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6C59620C28A7;
	Fri, 13 Nov 2020 09:23:15 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6C59620C28A7
To: Mimi Zohar <zohar@linux.ibm.com>, stephen.smalley.work@gmail.com,
	casey@schaufler-ca.com, agk@redhat.com, snitzer@redhat.com,
	gmazyland@gmail.com, paul@paul-moore.com
References: <20201101222626.6111-1-tusharsu@linux.microsoft.com>
	<20201101222626.6111-4-tusharsu@linux.microsoft.com>
	<1f83ec246cb6356c340b379ab00e43f0b5bba0ae.camel@linux.ibm.com>
	<25622ca6-359d-fa97-c5e6-e314cba51306@linux.microsoft.com>
	<0f25c77c042f3e62405f12966c2358fe8cd82116.camel@linux.ibm.com>
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <1ce2b55e-5dd0-b147-5570-55e8db774055@linux.microsoft.com>
Date: Fri, 13 Nov 2020 09:23:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0f25c77c042f3e62405f12966c2358fe8cd82116.camel@linux.ibm.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0ADHNOOl001287
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 16 Nov 2020 04:37:38 -0500
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v5 3/7] IMA: add hook to measure critical data
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

Cj4+PiBJbmNsdWRpbmcgImRhdGFfc291cmNlIiBoZXJlIGlzbid0IHF1aXRlIHJpZ2h0LiAgImRh
dGEgc291cmNlIiBzaG91bGQKPj4+IG9ubHkgYmUgYWRkZWQgaW4gdGhlIGZpcnN0IHBhdGNoIHdo
aWNoIHVzZXMgaXQsIG5vdCBoZXJlLiAgIFdoZW4gYWRkaW5nCj4+PiBpdCBwbGVhc2Ugc2hvcnRl
biB0aGUgZmllbGQgZGVzY3JpcHRpb24gdG8gImtlcm5lbCBkYXRhIHNvdXJjZSIuICAgVGhlCj4+
PiBsb25nZXIgZXhwbGFuYXRpb24gY2FuIGJlIGluY2x1ZGVkIGluIHRoZSBsb25nZXIgZnVuY3Rp
b24gZGVzY3JpcHRpb24uCj4+Pgo+PiAqUXVlc3Rpb24qCj4+IERvIHlvdSBtZWFuIHRoZSBwYXJh
bWV0ZXIgQGV2ZW50X2RhdGFfc291cmNlIHNob3VsZCBiZSByZW1vdmVkIGZyb20gdGhpcwo+PiBw
YXRjaD8gQW5kIHRoZW4gbGF0ZXIgYWRkZWQgaW4gcGF0Y2ggNy83IOKAkyB3aGVyZSBTZUxpbnV4
IHVzZXMgaXQ/Cj4gCj4gRGF0YSBzb3VyY2Ugc3VwcG9ydCBkb2Vzbid0IGJlbG9uZyBpbiB0aGlz
IHBhdGNoLiAgRWFjaCBwYXRjaCBzaG91bGQgZG8KPiBvbmUgbG9naWNhbCB0aGluZyBhbmQgb25s
eSB0aGF0IG9uZSB0aGluZy4gIFRoaXMgcGF0Y2ggaXMgYWRkaW5nCj4gc3VwcG9ydCBmb3IgbWVh
c3VyaW5nIGNyaXRpY2FsIGRhdGEuICBUaGUgZGF0YSBzb3VyY2UgcGF0Y2ggd2lsbCBsaW1pdAo+
IHRoZSBjcml0aWNhbCBkYXRhIGJlaW5nIG1lYXN1cmVkLgo+IAo+IE90aGVyIHRoYW4gdXBkYXRp
bmcgdGhlIGRhdGEgc291cmNlIGxpc3QgaW4gdGhlIGRvY3VtZW50YXRpb24sCj4gZGVmaW5pdGVs
eSBkbyBub3QgYWRkIGRhdGEgc291cmNlIHN1cHBvcnQgdG8gdGhlIFNFTGludXggcGF0Y2guCj4g
Cj4gdGhhbmtzLAo+IAo+IE1pbWkKPiAKTWFrZXMgc2Vuc2UsIEkgd2lsbCBtb3ZlIHRoZSBkYXRh
X3NvdXJjZSBmcm9tIHRoaXMgcGF0Y2ggdG8gYQpzZXBhcmF0ZSBvbmUgYmVmb3JlIFNlTGludXgu
CkFuZCB0aGUgU2VMaW51eCBwYXRjaCB3aWxsIHNpbXBseSB1cGRhdGUgdGhlIGRvY3VtZW50YXRp
b24uCgpUaGFua3MgTWltaS4KCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVk
aGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

