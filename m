Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6FCDC2685D1
	for <lists+dm-devel@lfdr.de>; Mon, 14 Sep 2020 09:27:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-FSwGp-wSNISmG14Cjgytvg-1; Mon, 14 Sep 2020 03:26:52 -0400
X-MC-Unique: FSwGp-wSNISmG14Cjgytvg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B1B61074644;
	Mon, 14 Sep 2020 07:26:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77A4360F96;
	Mon, 14 Sep 2020 07:26:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 36D848C7C1;
	Mon, 14 Sep 2020 07:26:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08BHTSCp024032 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 11 Sep 2020 13:29:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 73DD92144B4C; Fri, 11 Sep 2020 17:29:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E07E2144B32
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 17:29:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB770811E78
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 17:29:25 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-536-LE94lXgaPH-PfhxpdB0CiQ-1;
	Fri, 11 Sep 2020 13:29:21 -0400
X-MC-Unique: LE94lXgaPH-PfhxpdB0CiQ-1
Received: from [192.168.86.21] (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id B1A9020D4DAB;
	Fri, 11 Sep 2020 10:29:18 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B1A9020D4DAB
To: Mimi Zohar <zohar@linux.ibm.com>, stephen.smalley.work@gmail.com,
	casey@schaufler-ca.com, agk@redhat.com, snitzer@redhat.com,
	gmazyland@gmail.com
References: <20200828015704.6629-1-tusharsu@linux.microsoft.com>
	<20200828015704.6629-5-tusharsu@linux.microsoft.com>
	<652406e1a08d855a5d9a3e3815835653a12df411.camel@linux.ibm.com>
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <0dc88680-eb1c-4343-ad8e-18b0df8d5142@linux.microsoft.com>
Date: Fri, 11 Sep 2020 10:29:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <652406e1a08d855a5d9a3e3815835653a12df411.camel@linux.ibm.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08BHTSCp024032
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 14 Sep 2020 03:23:33 -0400
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v3 4/6] IMA: add policy to measure critical
 data from kernel components
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Content-Language: en-US

CgpPbiAyMDIwLTA4LTMxIDExOjE1IGEubS4sIE1pbWkgWm9oYXIgd3JvdGU6Cj4gT24gVGh1LCAy
MDIwLTA4LTI3IGF0IDE4OjU3IC0wNzAwLCBUdXNoYXIgU3VnYW5kaGkgd3JvdGU6Cj4+IFRoZXJl
IHdvdWxkIGJlIHNldmVyYWwgY2FuZGlkYXRlIGtlcm5lbCBjb21wb25lbnRzIHN1aXRhYmxlIGZv
ciBJTUEKPj4gbWVhc3VyZW1lbnQuIE5vdCBhbGwgb2YgdGhlbSB3b3VsZCBoYXZlIHN1cHBvcnQg
Zm9yIElNQSBtZWFzdXJlbWVudC4KPj4gQWxzbywgc3lzdGVtIGFkbWluaXN0cmF0b3JzIG1heSBu
b3Qgd2FudCB0byBtZWFzdXJlIGRhdGEgZm9yIGFsbCBvZgo+PiB0aGVtLCBldmVuIHdoZW4gdGhl
eSBzdXBwb3J0IElNQSBtZWFzdXJlbWVudC4gQW4gSU1BIHBvbGljeSBzcGVjaWZpYwo+PiB0byB2
YXJpb3VzIGtlcm5lbCBjb21wb25lbnRzIGlzIG5lZWRlZCB0byBtZWFzdXJlIHRoZWlyIHJlc3Bl
Y3RpdmUKPj4gY3JpdGljYWwgZGF0YS4KPiAKPiBUaGUgYmFzZSBwb2xpY3kgcnVsZXMgYXJlIHdp
ZGUsIGJ1dCBtYXkgYmUgY29uc3RyYWluZWQgYnkgc3BlY2lmeWluZwo+IGRpZmZlcmVudCBvcHRp
b25zLiAgRm9yIGV4YW1wbGUgdGhlIGJ1aWx0aW4gcG9saWN5IHJ1bGVzIGNhbm5vdCBiZQo+IHdy
aXR0ZW4gaW4gdGVybXMgTFNNIGxhYmVscywgd2hpY2ggd291bGQgY29uc3RyYWluIHRoZW0uICBB
IHBvbGljeSBydWxlCj4gbWF5IG1lYXN1cmUgYWxsIGtleXJpbmdzIG9yIG1heSBjb25zdHJhaW4g
d2hpY2gga2V5cmluZ3MgbmVlZCB0byBiZQo+IG1lYXN1cmVkLiAgTWVhc3VyaW5nIGNyaXRpY2Fs
IGRhdGEgaXMgbm90IGFueSBkaWZmZXJlbnQuCj4gCj4gUGxlYXNlIHJld3JpdGUgdGhlIGFib3Zl
IHBhcmFncmFwaCBhY2NvcmRpbmdseS4KPiAKT2suIFdpbGwgZG8uCj4+Cj4+IEFkZCBhIG5ldyBJ
TUEgcG9saWN5ICJjcml0aWNhbF9rZXJuZWxfZGF0YV9zb3VyY2VzIiB0byBzdXBwb3J0IG1lYXN1
cmluZwo+PiB2YXJpb3VzIGNyaXRpY2FsIGtlcm5lbCBjb21wb25lbnRzLiBUaGlzIHBvbGljeSB3
b3VsZCBlbmFibGUgdGhlCj4+IHN5c3RlbSBhZG1pbmlzdHJhdG9ycyB0byBsaW1pdCB0aGUgbWVh
c3VyZW1lbnQgdG8gdGhlIGNvbXBvbmVudHMsCj4+IGlmIHRoZSBjb21wb25lbnRzIHN1cHBvcnQg
SU1BIG1lYXN1cmVtZW50Lgo+IAo+ICJjcml0aWNhbF9rZXJuZWxfZGF0YV9zb3VyY2VzIiBpcyBy
ZWFsbHkgd29yZHkuICAgRmluZCBhIGJldHRlciwgc2VsZgo+IGRlZmluaW5nIHRlcm0gZm9yIGRl
c2NyaWJpbmcgdGhlIHR5cGUgb2YgZGF0YSwgb25lIHRoYXQgaXNuJ3Qgc28gd29yZHksCj4gYW5k
IHJlZmxlY3QgaXQgaW4gdGhlIGNvZGUuCj4gCldpbGwgZG8uIEkgd2lsbCBnbyB3aXRoICJjcml0
aWNhbF9kYXRhIi4gWW91IGFsc28gaGF2ZSBzdWdnZXN0ZWQgaXQgaW4KdGhlIGNvbW1lbnQgYmVs
b3cuCgoiY3JpdGljYWxfZGF0YV9zb3VyY2VzIiBhbHNvIHNlZW1zIHJpZ2h0LCBidXQgdGhhdCdz
IG1vcmUgd29yZHkgdGhhbgoiY3JpdGljYWxfZGF0YSIuCgpTb21lIG1vcmUgb3B0aW9ucyB3ZSBj
b25zaWRlcmVkLCBidXQgdGhleSBkb27igJl0IHNvdW5kIHJpZ2h0LgpQbGVhc2UgbGV0IHVzIGtu
b3cgd2hhdCBkbyB5b3UgdGhpbmsuCjEuICJjcml0aWNhbF9kYXRhX3NvdXJjZXM9IgoyLiAiY3Jp
dGljYWxfa2VybmVsX2NvbXBvbmVudHM9IiAtb3ItICJjcml0X2tybmxfY29tcHM9IgozLiAiY3Jp
dGljYWxfZGF0YV9wcm92aWRlcnM9Igo0LiAiY3JpdGljYWxfa2VybmVsX2RhdGFfcHJvdmlkZXJz
PSIgLW9yLSAiY3JpdF9rcm5sX2R0X3Byb3ZzPSIKNS4gImNyaXRpY2FsX2tlcm5lbF9kYXRhX3Nv
dXJjZXM9IiAtb3ItICJjcml0X2tybmxfZHRfc3Jjcz0iCjYuICJzZWN1cml0eV9jcml0aWNhbF9k
YXRhPSIKNy4gInByb3RlY3RhYmxlX2RhdGE9Igo4LiAicHJvdGVjdGVkX2RhdGE9Igo5LiAidml0
YWxfcHJvdGVjdGVkX2RhdGE9IgoKPj4KPj4gU2lnbmVkLW9mZi1ieTogVHVzaGFyIFN1Z2FuZGhp
IDx0dXNoYXJzdUBsaW51eC5taWNyb3NvZnQuY29tPgo+PiAtLS0KPj4gICBEb2N1bWVudGF0aW9u
L0FCSS90ZXN0aW5nL2ltYV9wb2xpY3kgfCAgMyArKysKPj4gICBzZWN1cml0eS9pbnRlZ3JpdHkv
aW1hL2ltYV9wb2xpY3kuYyAgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKysrKystCj4+ICAg
MiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL2ltYV9wb2xpY3kgYi9Eb2N1bWVu
dGF0aW9uL0FCSS90ZXN0aW5nL2ltYV9wb2xpY3kKPj4gaW5kZXggY2Q1NzI5MTJjNTkzLi43Y2Nk
YzE5NjRlMjkgMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vQUJJL3Rlc3RpbmcvaW1hX3Bv
bGljeQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL2ltYV9wb2xpY3kKPj4gQEAg
LTQ4LDYgKzQ4LDkgQEAgRGVzY3JpcHRpb246Cj4+ICAgCQkJdGVtcGxhdGU6PSBuYW1lIG9mIGEg
ZGVmaW5lZCBJTUEgdGVtcGxhdGUgdHlwZQo+PiAgIAkJCShlZywgaW1hLW5nKS4gT25seSB2YWxp
ZCB3aGVuIGFjdGlvbiBpcyAibWVhc3VyZSIuCj4+ICAgCQkJcGNyOj0gZGVjaW1hbCB2YWx1ZQo+
PiArCQkJY3JpdGljYWxfa2VybmVsX2RhdGFfc291cmNlczo9IGxpc3Qgb2Yga2VybmVsCj4+ICsJ
CQljb21wb25lbnRzIChlZywgc2VsaW51eHxhcHBhcm1vcnxkbS1jcnlwdCkgdGhhdAo+PiArCQkJ
Y29udGFpbiBkYXRhIGNyaXRpY2FsIHRvIHRoZSBzZWN1cml0eSBvZiB0aGUga2VybmVsLgo+IAo+
IFRoaXMgb3JpZ2luYWwgcG9saWN5IGRlZmluaXRpb24sIGZvciB0aGUgbW9zdCBwYXJ0LCBpcyBp
biBCYWNrdXPigJNOYXVyCj4gZm9ybWF0LiAgIFRoZSBrZXlyaW5nIG5hbWVzIGlzIGFuIGV4Y2Vw
dGlvbiwgYmVjYXVzZSBpdCBpcyBub3QgbGltaXRlZAo+IHRvIHByZS1kZWZpbmVkIGtlcm5lbCBv
YmplY3RzLiAgVGhlIGNyaXRpY2FsIGRhdGEgaG9vayBpcyBtZWFzdXJpbmcKPiB0aGluZ3MgaW4g
a2VybmVsIG1lbW9yeS4gIEFzIG5ldyBjYWxscyB0byBtZWFzdXJlIGNyaXRpY2FsIGRhdGEgYXJl
Cj4gYWRkZWQsIG5ldyBpZGVudGlmaWVycyB3b3VsZCBiZSBhZGRlZCBoZXJlLgo+IAo+IEZvciBl
eGFtcGxlLCBpZiBTRUxpbnV4IGlzIHRoZSBmaXJzdCBleGFtcGxlIG9mIG1lYXN1cmluZyBjcml0
aWNhbAo+IGRhdGEsIHRoZW4gdGhlIFNFTGludXggY3JpdGljYWwgZGF0YSBwYXRjaCB3b3VsZCBp
bmNsdWRlCj4gImNyaXRpY2FsX2RhdGE6PSBbc2VsaW51eF0iLiAgRWFjaCBzdWJzZXF1ZW50IGNy
aXRpY2FsIGRhdGEgYmVpbmcKPiBtZWFzdXJlZCB3b3VsZCBleHRlbmQgdGhpcyBsaXN0LiAgQXQg
dGhlIHNhbWUgdGltZSwgdGhlIGxpc3Qgb2Yga25vd24KPiAiY3JpdGljYWwgZGF0YSIgZGVmaW5l
ZCBpbiBwYXRjaCA2LzYgd291bGQgYmUgdXBkYXRlZC4KPiAKPiBOb3JtYWxseSBhIG5ldyBmZWF0
dXJlIGFuZCB0aGUgZmlyc3QgdXNhZ2Ugb2YgdGhhdCBmZWF0dXJlIGFyZSBpbmNsdWRlZAo+IGlu
IHRoZSBzYW1lIHBhdGNoIHNldC4gIFNlcGFyYXRpbmcgdGhlbSBsaWtlIHRoaXMgbWFrZXMgaXQg
ZGlmZmljdWx0IHRvCj4gd3JpdGUsIHJldmlldyBhbmQgdXBzdHJlYW0uCj4gCj4gTWltaQo+IApJ
IGFncmVlLiBCdXQgdGhlIHVuaXF1ZSBpc3N1ZSB3ZSBhcmUgZmFjaW5nIGhlcmUgaXMgdGhlcmUg
YXJlIHR3bwoiZmlyc3QgdXNlcnMiIG9mIHRoaXMgbmV3ICJiYXNlIHNlcmllcyIuCgpPbmUsIFNl
TGludXggd29yayAoZHJpdmVuIGJ5IExha3NobWkpOyBhbmQgdHdvLCBkZXZpY2UtbWFwcGVyL2Rt
LWNyeXB0IAp3b3JrIChkcml2ZW4gYnkgbWUpLgoKQm90aCBvZiB0aGVtIG5lZWQgdG8gYmUgcmV2
aWV3ZWQgYnkgZGlmZmVyZW50IG1haW50YWluZXJzLCBtYXkgZ28gCnRocm91Z2ggc2V2ZXJhbCBp
dGVyYXRpb25zIGJlZm9yZSBnZXR0aW5nIGFjY2VwdGVkLgoKVGhhdOKAmXMgd2h5IHdlIHdhbnRl
ZCB0byBrZWVwIHRoaXMgImJhc2Ugc2VyaWVzIiBpbmRlcGVuZGVudCBvZiB0aGUgCiJmaXJzdCB1
c2VycyI7IGFuZCBjYWxsZWQgdGhlICJiYXNlIHNlcmllcyIgYXMgYSBkZXBlbmRlbmN5IGluIHRo
ZSAKZG0tY3J5cHRbMV0gLyBTZUxpbnV4WzJdIHNlcmllcy4KCldlIHdvdWxkIGFwcHJlY2lhdGUg
eW91ciBndWlkYW5jZSBvbiBob3cgd2UgY2FuIGJldHRlciBhdXRob3IgdGhlc2UKdGhyZWUgc2Vy
aWVzIC0gMS50aGlzIGJhc2Ugc2VyaWVzIDIuIGRtLWNyeXB0IHNlcmllcyBhbmQgMy4gU2VMaW51
eApzZXJpZXMuCgpbMV1kbS1jcnlwdCBTZXJpZXM6IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcGF0Y2gvMTE3NDM3MTUvClsyXVNlTGludXggU2VyaWVzOiBodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3BhdGNoLzExNzYyMjg3LwoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1k
ZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9k
bS1kZXZlbA==

