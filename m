Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E84692E9DB2
	for <lists+dm-devel@lfdr.de>; Mon,  4 Jan 2021 20:03:54 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-5dQGPYAvPRumJKYmAz7heA-1; Mon, 04 Jan 2021 14:03:47 -0500
X-MC-Unique: 5dQGPYAvPRumJKYmAz7heA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6220100C626;
	Mon,  4 Jan 2021 19:03:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41BB11002393;
	Mon,  4 Jan 2021 19:03:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E827B1809CA7;
	Mon,  4 Jan 2021 19:03:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BS3Yivn011828 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 27 Dec 2020 22:34:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 750E52166B2B; Mon, 28 Dec 2020 03:34:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 702AA2166B28
	for <dm-devel@redhat.com>; Mon, 28 Dec 2020 03:34:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38321185A794
	for <dm-devel@redhat.com>; Mon, 28 Dec 2020 03:34:42 +0000 (UTC)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.228]) by
	relay.mimecast.com with ESMTP id us-mta-449-iMHcSR1yMn2-H9pssU226g-1;
	Sun, 27 Dec 2020 22:34:35 -0500
X-MC-Unique: iMHcSR1yMn2-H9pssU226g-1
HMM_SOURCE_IP: 172.18.0.48:27453.1026267480
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.21?logid-8bb8c3acc19c4f808c194c4354987b63
	(unknown [172.18.0.48])
	by chinatelecom.cn (HERMES) with SMTP id A02F428018A;
	Mon, 28 Dec 2020 11:34:28 +0800 (CST)
X-189-SAVE-TO-SEND: wucy11@chinatelecom.cn
Received: from  ([172.18.0.48])
	by App0024 with ESMTP id 8bb8c3acc19c4f808c194c4354987b63 for
	zhangzijian@chinatelecom.cn; Mon Dec 28 11:34:30 2020
X-Transaction-ID: 8bb8c3acc19c4f808c194c4354987b63
X-filter-score: filter<0>
X-Real-From: wucy11@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: Chongyun Wu <wucy11@chinatelecom.cn>
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Message-ID: <4ca7da32-5777-9089-1e96-a5dbb46c585a@chinatelecom.cn>
Date: Mon, 28 Dec 2020 11:34:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.6.0
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0BS3Yivn011828
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 04 Jan 2021 14:03:12 -0500
Cc: yubin1@chinatelecom.cn, zhangzijian@chinatelecom.cn
Subject: [dm-devel] [PATCH] multipathd: LUN protection by checking path's
 wwid change status
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

IEZyb20gMzdjNzQ4NzNhY2ZjMTU4N2U3OWE2NTA0Y2EzZDQyYjhmYTAwZDQ5ZSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKCkZyb206IENob25neXVuIFd1IDx3dWN5MTFAY2hpbmF0ZWxlY29tLmNu
PgpEYXRlOiBNb24sIDIxIERlYyAyMDIwIDA5OjUxOjIwICswODAwClN1YmplY3Q6IFtQQVRDSF0g
bXVsdGlwYXRoZDogTFVOIGRhdGEgcHJvdGVjdGlvbiBieSBjaGVja2luZyBwYXRoJ3Mgd3dpZAog
wqBjaGFuZ2Ugc3RhdHVzCgpJc3N1ZSBkZXNjcmlwdGlvbjoKQSkgRGV2aWNlIHNkYSBhbmQgc2Ri
IGNvcnJlc3BlbmQgdG8gTFVOMSBhbmQgTFVOMiBpbiBzdG9yYWdlIGJhY2tlbmQgYW5kCnRoZSB1
cHBlciBsYXllciBhcHBsaWNhdGlvbiB1c2VzIHRob3NlIHR3byBkZXZpY2VzLgpCKSBEb2luZyBp
bGxlZ2FsIG9wZXJhdGlvbjogdW5tYXBwaW5nIExVTjEgYW5kIExVTjIgaW4gc3RvcmFnZSBiYWNr
ZW5kLAphbmQgZXhwb3J0IExVTjIgYW5kIExVTjEgdG8gaG9zdCB3aXRoIGV4Y2hhbmdlZCBhc3Np
Z25tZW50IHJlbGF0aW9uCmJldHdlZW4gc2RhIGFuZCBzZGIuCkMpIFRoZSB1cHBlciBsYXllciBh
cHBsaWNhdGlvbiBydW4gZm9yIGEgd2hpbGUgYW5kIGZvdW5kIHRoYXQgdGhlIGRhdGEKaW4gYm90
aCBMVU4xIGFuZCBMVU4yIGhhcyBiZWVuIGNvcnJ1cHRlZC4KClByb3RlY3Rpb24gbWV0aG9kOgpC
ZWZvcmUgcHJvY2Vzc2luZyBiZWxvdyBwcm9jZXNzIGNoZWNrIHRoZSBwYXRoIHd3aWQgZmlyc3Qs
IGlmIHd3aWQKY2hhbmdlZCBqdXN0IHJlbW92ZSB0aGlzIHBhdGggbm90IHRvIHVzZSBpdCBhZ2Fp
bjoKMSlwcm9jZXNzIGFkZCBwYXRoIHVldmVudDsKMilwcm9jZXNzIHBhdGggcmVpbnN0YXRlOwoz
KXByb2Nlc3MgYWRkIHBhdGggY2xpIGNvbW1hbmQ7Ck5vdGU6IG11bHRpcGF0aCBhbHJlYWR5IGhh
dmUgY2hhbmcgdXZldmVudCB3d2lkIGNoYW5nZSBjaGVjayBidXQKZmVsbG93IGFib3ZlIGlzc3Vl
IHJlcHJvZHVjZSBzdGVwLCB0aGVyZSBpcyBub3QgY2hhbmdlIHVldmVudCBidXQKaGF2ZSBhZGQg
cGF0aCBldmVudCBhbmQgcmVtb3ZlIHVldmVudChzb21ldGltZXMpLgoKVGVzdCByZXN1bHQ6CkFm
dGVyIHN3aXRjaGluZyB0aGUgYXNzaWdubWVudCByZWxhdGlvbiBpbiBzdG9yYWdlIGJhY2tlbmQs
IHRoZSByZWxhdGVkCmRldmljZSBoYXMgYmVlbiByZW1vdmVkIG9yIGtlZXAgZmFpbGVkIHN0YXRl
IGFuZCBMVU4gZGF0YSBub3QgYmVlbgpjb3JydXB0ZWQgYWdhaW4uCgpTaWduZWQtb2ZmLWJ5OiBD
aG9uZ3l1biBXdSA8d3VjeTExQGNoaW5hdGVsZWNvbS5jbj4KLS0tCiDCoGxpYm11bHRpcGF0aC9j
b25maWd1cmUuY8KgIHwgMTMgKysrKysrKysKIMKgbGlibXVsdGlwYXRoL2NvbmZpZ3VyZS5owqAg
fMKgIDEgKwogwqBtdWx0aXBhdGhkL2NsaV9oYW5kbGVycy5jIHzCoCA3ICsrKysrCiDCoG11bHRp
cGF0aGQvbWFpbi5jwqDCoMKgwqDCoMKgwqDCoCB8IDYzICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwogwqBtdWx0aXBhdGhkL21haW4uaMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDIgKy0KIMKgNSBmaWxlcyBjaGFuZ2VkLCA4NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvbGlibXVsdGlwYXRoL2NvbmZpZ3VyZS5jIGIvbGlibXVsdGlwYXRoL2Nv
bmZpZ3VyZS5jCmluZGV4IDZmYjQ3N2ZjLi42ZGM4MjQ1ZiAxMDA2NDQKLS0tIGEvbGlibXVsdGlw
YXRoL2NvbmZpZ3VyZS5jCisrKyBiL2xpYm11bHRpcGF0aC9jb25maWd1cmUuYwpAQCAtNTY5LDYg
KzU2OSwxOSBAQCB1bnJlZjoKIMKgwqDCoMKgIHVkZXZfZW51bWVyYXRlX3VucmVmKHBhcnRfZW51
bSk7CiDCoH0KCit2b2lkCit0cmlnZ2VyX3BhdGhfdWRldl9yZW1vdmUoc3RydWN0IHBhdGggKnBw
KQoreworwqDCoMKgIGNvbnN0IGNoYXIgKmFjdGlvbiA9ICJyZW1vdmUiOworCivCoMKgwqAgaWYg
KCFwcCB8fCAhcHAtPnVkZXYpCivCoMKgwqAgwqDCoMKgIHJldHVybjsKKworwqDCoMKgIGNvbmRs
b2coMCwgIiVzIHd3aWQgY2hhbmdlZCwgdHJpZ2dlciAlcyB1ZXZlbnQiLCBwcC0+ZGV2LCBhY3Rp
b24pOworwqDCoMKgIHN5c2ZzX2F0dHJfc2V0X3ZhbHVlKHBwLT51ZGV2LCAidWV2ZW50IiwgYWN0
aW9uLCBzdHJsZW4oYWN0aW9uKSk7CivCoMKgwqAgdHJpZ2dlcl9wYXJ0aXRpb25zX3VkZXZfY2hh
bmdlKHBwLT51ZGV2LCBhY3Rpb24sIHN0cmxlbihhY3Rpb24pKTsKK30KKwogwqB2b2lkCiDCoHRy
aWdnZXJfcGF0aHNfdWRldl9jaGFuZ2Uoc3RydWN0IG11bHRpcGF0aCAqbXBwLCBib29sIGlzX21w
YXRoKQogwqB7CmRpZmYgLS1naXQgYS9saWJtdWx0aXBhdGgvY29uZmlndXJlLmggYi9saWJtdWx0
aXBhdGgvY29uZmlndXJlLmgKaW5kZXggNmIyM2NjYmIuLjJjMTY5N2VmIDEwMDY0NAotLS0gYS9s
aWJtdWx0aXBhdGgvY29uZmlndXJlLmgKKysrIGIvbGlibXVsdGlwYXRoL2NvbmZpZ3VyZS5oCkBA
IC01OCwzICs1OCw0IEBAIGludCBnZXRfcmVmd3dpZCAoZW51bSBtcGF0aF9jbWRzIGNtZCwgY29u
c3QgY2hhciAqZGV2LCAKZW51bSBkZXZ0eXBlcyBkZXZfdHlwZSwKIMKgwqDCoMKgIMKgwqDCoCDC
oHZlY3RvciBwYXRodmVjLCBjaGFyICoqd3dpZCk7CiDCoHN0cnVjdCB1ZGV2X2RldmljZSAqZ2V0
X3VkZXZfZGV2aWNlKGNvbnN0IGNoYXIgKmRldiwgZW51bSBkZXZ0eXBlcyAKZGV2X3R5cGUpOwog
wqB2b2lkIHRyaWdnZXJfcGF0aHNfdWRldl9jaGFuZ2Uoc3RydWN0IG11bHRpcGF0aCAqbXBwLCBi
b29sIGlzX21wYXRoKTsKK3ZvaWQgdHJpZ2dlcl9wYXRoX3VkZXZfcmVtb3ZlKHN0cnVjdCBwYXRo
ICpwcCk7CmRpZmYgLS1naXQgYS9tdWx0aXBhdGhkL2NsaV9oYW5kbGVycy5jIGIvbXVsdGlwYXRo
ZC9jbGlfaGFuZGxlcnMuYwppbmRleCAyMzVlMmEyZS4uODM2ZjU0NjUgMTAwNjQ0Ci0tLSBhL211
bHRpcGF0aGQvY2xpX2hhbmRsZXJzLmMKKysrIGIvbXVsdGlwYXRoZC9jbGlfaGFuZGxlcnMuYwpA
QCAtNzE1LDYgKzcxNSwxMyBAQCBjbGlfYWRkX3BhdGggKHZvaWQgKiB2LCBjaGFyICoqIHJlcGx5
LCBpbnQgKiBsZW4sIAp2b2lkICogZGF0YSkKIMKgwqDCoMKgIHBwID0gZmluZF9wYXRoX2J5X2Rl
dih2ZWNzLT5wYXRodmVjLCBwYXJhbSk7CiDCoMKgwqDCoCBpZiAocHAgJiYgcHAtPmluaXRpYWxp
emVkICE9IElOSVRfUkVNT1ZFRCkgewogwqDCoMKgwqAgwqDCoMKgIGNvbmRsb2coMiwgIiVzOiBw
YXRoIGFscmVhZHkgaW4gcGF0aHZlYyIsIHBhcmFtKTsKKworwqDCoMKgIMKgwqDCoCAvKiBDaGVj
ayBpZiBXV0lEIGhhcyBjaGFuZ2VkIHRvIHByb3RlY3QgZGF0YSBmcm9tIGJlaW5nIHdpcnR0ZW4g
CnRvIHRoZSB3cm9uZyBkZXZpY2UgKi8KK8KgwqDCoCDCoMKgwqAgaWYgKGNoZWNrX3d3aWRfY2hh
bmdlKHBwLCB2ZWNzKSkgeworwqDCoMKgIMKgwqDCoCDCoMKgwqAgY29uZGxvZygwLCAiY2xpIGFk
ZCBwYXRoIGZhaWxlZCBmb3IgJXMgd3dpZCBjaGFuZ2VkIiwgcHAtPmRldik7CivCoMKgwqAgwqDC
oMKgIMKgwqDCoCByZXR1cm4gMTsKK8KgwqDCoCDCoMKgwqAgfQorCiDCoMKgwqDCoCDCoMKgwqAg
aWYgKHBwLT5tcHApCiDCoMKgwqDCoCDCoMKgwqAgwqDCoMKgIHJldHVybiAwOwogwqDCoMKgwqAg
fSBlbHNlIGlmIChwcCkgewpkaWZmIC0tZ2l0IGEvbXVsdGlwYXRoZC9tYWluLmMgYi9tdWx0aXBh
dGhkL21haW4uYwppbmRleCBhNGFiYmIyNy4uYWRlZGFmN2EgMTAwNjQ0Ci0tLSBhL211bHRpcGF0
aGQvbWFpbi5jCisrKyBiL211bHRpcGF0aGQvbWFpbi5jCkBAIC04MTMsNiArODEzLDQzIEBAIGV2
X3JlbW92ZV9tYXAgKGNoYXIgKiBkZXZuYW1lLCBjaGFyICogYWxpYXMsIGludCAKbWlub3IsIHN0
cnVjdCB2ZWN0b3JzICogdmVjcykKIMKgwqDCoMKgIHJldHVybiBmbHVzaF9tYXAobXBwLCB2ZWNz
LCAwKTsKIMKgfQoKK2Jvb2wgY2hlY2tfd3dpZF9jaGFuZ2Uoc3RydWN0IHBhdGggKnBwLCBzdHJ1
Y3QgdmVjdG9ycyAqdmVjcykKK3sKK8KgwqDCoCBjaGFyIHd3aWRbV1dJRF9TSVpFXTsKK8KgwqDC
oCBpbnQgbGVuID0wOworwqDCoMKgIGNoYXIgKmM7CisKK8KgwqDCoCBpZiAoIXN0cmxlbihwcC0+
d3dpZCkpCivCoMKgwqAgwqDCoMKgIHJldHVybiBmYWxzZTsKKworwqDCoMKgIC8qIEdldCB0aGUg
cmVhbCBmcmVzaCBkZXZpY2Ugd3dpZCBieSBzZ2lvICovCivCoMKgwqAgbGVuID0gZ2V0X3ZwZF9z
Z2lvKHBwLT5mZCwgMHg4MywgMCwgd3dpZCwgV1dJRF9TSVpFKTsKK8KgwqDCoCBjb25kbG9nKDMs
ICJHZXQgd3dpZCglcykgb2YgZGV2KCVzKSBieSBzZ2lvIiwgd3dpZCwgcHAtPmRldik7CisKK8Kg
wqDCoCBpZiAobGVuIDw9IDApIHsKK8KgwqDCoCDCoMKgwqAgY29uZGxvZygzLCAiRmFpbGVkIHRv
IGdldCB3d2lkIGZvciAlcyBieSBzZ2lvOiBsZW4gPSAlZCIsIApwcC0+ZGV2LCBsZW4pOworwqDC
oMKgIMKgwqDCoCByZXR1cm4gZmFsc2U7CivCoMKgwqAgfSBlbHNlIHsKK8KgwqDCoCDCoMKgwqAg
LypTdHJpcCBhbnkgdHJhaWxpbmcgYmxhbmtzICovCivCoMKgwqAgwqDCoMKgIGMgPSBzdHJjaHIo
d3dpZCwgJ1wwJyk7CivCoMKgwqAgwqDCoMKgIGMtLTsKK8KgwqDCoCDCoMKgwqAgd2hpbGUgKGMg
JiYgYyA+PSB3d2lkICYmICpjID09ICcgJykgeworwqDCoMKgIMKgwqDCoCDCoMKgwqAgKmMgPSAn
XDAnOworwqDCoMKgIMKgwqDCoCDCoMKgwqAgYy0tOworwqDCoMKgIMKgwqDCoCB9CivCoMKgwqAg
fQorCivCoMKgwqAgaWYgKHN0cm5jbXAod3dpZCwgcHAtPnd3aWQsIFdXSURfU0laRSkpIHsKK8Kg
wqDCoCDCoMKgwqAgY29uZGxvZygwLCAicGF0aCAlcyB3d2lkIGNoYW5nZWQgZnJvbSAnJXMnIHRv
ICclcycsIHRyeSB0byAKcmVtb3ZlIGl0IiwKK8KgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCBw
cC0+ZGV2LCBwcC0+d3dpZCwgd3dpZCk7CivCoMKgwqAgwqDCoMKgIHRyaWdnZXJfcGF0aF91ZGV2
X3JlbW92ZShwcCk7CivCoMKgwqAgwqDCoMKgIGV2X3JlbW92ZV9wYXRoKHBwLCB2ZWNzLCAxKTsK
K8KgwqDCoCDCoMKgwqAgcmV0dXJuIHRydWU7CivCoMKgwqAgfQorCivCoMKgwqAgcmV0dXJuIGZh
bHNlOworfQorCiDCoHN0YXRpYyBpbnQKIMKgdWV2X2FkZF9wYXRoIChzdHJ1Y3QgdWV2ZW50ICp1
ZXYsIHN0cnVjdCB2ZWN0b3JzICogdmVjcywgaW50IG5lZWRfZG9fbWFwKQogwqB7CkBAIC05MTAs
NiArOTQ3LDE5IEBAIHVldl9hZGRfcGF0aCAoc3RydWN0IHVldmVudCAqdWV2LCBzdHJ1Y3QgdmVj
dG9ycyAqIAp2ZWNzLCBpbnQgbmVlZF9kb19tYXApCiDCoMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKg
wqDCoCDCoMKgwqAgdWV2LT5rZXJuZWwpOwogwqDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAg
cmV0ID0gMTsKIMKgwqDCoMKgIMKgwqDCoCDCoMKgwqAgfQorwqDCoMKgIMKgwqDCoCB9IGVsc2Ug
aWYgKHBwLT5tcHAgJiYgc3RybGVuKHBwLT53d2lkKSkgeworwqDCoMKgIMKgwqDCoCDCoMKgwqAg
LyoKK8KgwqDCoCDCoMKgwqAgwqDCoMKgIMKgKiBEYXRhIHByb3RlY3Rpb246IGNoZWNrIHBhdGgg
d3dpZCBhbmQgcmVtb3ZlIHRoaXMgcGF0aCAKd2hlbiB3d2lkIGNoYW5nZWQsCivCoMKgwqAgwqDC
oMKgIMKgwqDCoCDCoCogY2F1c2Ugb2Ygc3RvcmFnZSBiYWNrZW5kIGFzc2lnbm1lbnQgbWlnaHQg
YmVlbiBjaGFuZ2VkCivCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoCogYnkgaWxsZWdhbCBvcGVyYXRp
b24gbWFrZSB0aGlzIHBhdGggYWN0dWFsbHkgaW5kaWN0ZSB0byAKb3RoZXIgTFVOIGFuZCBrZXJu
ZWwgbWlnaHQKK8KgwqDCoCDCoMKgwqAgwqDCoMKgIMKgKiBub3QgYWRhcHQgc2NzaSBsYXllciBh
c3NnaW5tZW50IGF1dG9tYXRpYywgc28gbXVsdGlwYXRoZCAKbmVlZCB0byBjaGVjayBpdCBhbmQK
K8KgwqDCoCDCoMKgwqAgwqDCoMKgIMKgKiBtYWtlIHNvbWUgcHJvdGVjdGlvbiBieSByZW1vdmlu
ZyB0aGlzIHBhdGguCivCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoCovCivCoMKgwqAgwqDCoMKgIMKg
wqDCoCBpZiAoY2hlY2tfd3dpZF9jaGFuZ2UocHAsIHZlY3MpKSB7CivCoMKgwqAgwqDCoMKgIMKg
wqDCoCDCoMKgwqAgY29uZGxvZygyLCAiRGV0ZWN0IGRldiAlcyB3d2lkIGNoYW5nZWQgd2hlbiBw
cm9jZXNzaW5nIAphZGQgdXZlbnQiLAorwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDC
oCDCoMKgIHBwLT5kZXYpOworwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIHJldCA9IDE7CivC
oMKgwqAgwqDCoMKgIMKgwqDCoCB9CiDCoMKgwqDCoCDCoMKgwqAgfQogwqDCoMKgwqAgfQogwqDC
oMKgwqAgaWYgKHBwKQpAQCAtMTcwMCw2ICsxNzUwLDE5IEBAIHJlaW5zdGF0ZV9wYXRoIChzdHJ1
Y3QgcGF0aCAqIHBwKQogwqDCoMKgwqAgaWYgKCFwcC0+bXBwKQogwqDCoMKgwqAgwqDCoMKgIHJl
dHVybjsKCivCoMKgwqAgLyoKK8KgwqDCoCDCoCogRGF0YSBwcm90ZWN0aW9uIGJlZm9yZSByZWlu
c3RhdGUgcGF0aDogY2hlY2sgcGF0aCB3d2lkIGFuZCAKcmVtb3ZlIHRoaXMgcGF0aAorwqDCoMKg
IMKgKiB3aGVuIHd3aWQgY2hhbmdlZCwgY2F1c2Ugb2Ygc3RvcmFnZSBiYWNrZW5kIGFzc2lnbm1l
bnQgbWlnaHQgCmJlZW4gY2hhbmdlZAorwqDCoMKgIMKgKiBieSBpbGxlZ2FsIG9wZXJhdGlvbiBt
YWtlIHRoaXMgcGF0aCBhY3R1YWxseSBpbmRpY3RlIHRvIG90aGVyIApMVU4gYW5kIGtlcm5lbCBt
aWdodAorwqDCoMKgIMKgKiBub3QgYWRhcHQgc2NzaSBsYXllciBhc3NnaW5tZW50IGF1dG9tYXRp
Yywgc28gbXVsdGlwYXRoZCBuZWVkIHRvIApjaGVjayBpdCBhbmQKK8KgwqDCoCDCoCogbWFrZSBz
b21lIHByb3RlY3Rpb24gYnkgcmVtb3ZpbmcgdGhpcyBwYXRoIG9yIGF0IGxlc3Qgbm90IHRvIHVz
ZSAKdGhpcyBwYXRoLgorwqDCoMKgIMKgKi8KK8KgwqDCoCBpZiAoY2hlY2tfd3dpZF9jaGFuZ2Uo
cHAsIGd2ZWNzKSkgeworwqDCoMKgIMKgwqDCoCBjb25kbG9nKDAsICJEZXZpY2UgJXMgd3dpZCBj
aGFuZ2VkIG5vdCB0byByZWluc3RhdGUgdGhpcyBwYXRoIAphbmQgdHJ5IHRvIHJlbW92ZSBpdCIs
CivCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgcHAtPmRldik7CivCoMKgwqAgwqDCoMKgIHJl
dHVybjsKK8KgwqDCoCB9CisKIMKgwqDCoMKgIGlmIChkbV9yZWluc3RhdGVfcGF0aChwcC0+bXBw
LT5hbGlhcywgcHAtPmRldl90KSkKIMKgwqDCoMKgIMKgwqDCoCBjb25kbG9nKDAsICIlczogcmVp
bnN0YXRlIGZhaWxlZCIsIHBwLT5kZXZfdCk7CiDCoMKgwqDCoCBlbHNlIHsKZGlmZiAtLWdpdCBh
L211bHRpcGF0aGQvbWFpbi5oIGIvbXVsdGlwYXRoZC9tYWluLmgKaW5kZXggNWFiYmU5N2IuLjFi
NDMyOGUwIDEwMDY0NAotLS0gYS9tdWx0aXBhdGhkL21haW4uaAorKysgYi9tdWx0aXBhdGhkL21h
aW4uaApAQCAtNDksNSArNDksNSBAQCBpbnQgX19zZXR1cF9tdWx0aXBhdGggKHN0cnVjdCB2ZWN0
b3JzICogdmVjcywgc3RydWN0IAptdWx0aXBhdGggKiBtcHAsCiDCoGludCB1cGRhdGVfbXVsdGlw
YXRoIChzdHJ1Y3QgdmVjdG9ycyAqdmVjcywgY2hhciAqbWFwbmFtZSwgaW50IHJlc2V0KTsKIMKg
aW50IHJlbG9hZF9hbmRfc3luY19tYXAoc3RydWN0IG11bHRpcGF0aCAqbXBwLCBzdHJ1Y3QgdmVj
dG9ycyAqdmVjcywKIMKgwqDCoMKgIMKgwqDCoCDCoMKgwqAgaW50IHJlZnJlc2gpOwotCitib29s
IGNoZWNrX3d3aWRfY2hhbmdlKHN0cnVjdCBwYXRoICogcHAsIHN0cnVjdCB2ZWN0b3JzICogdmVj
cyk7CiDCoCNlbmRpZiAvKiBNQUlOX0ggKi8KLS0gCgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0
CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2RtLWRldmVs

