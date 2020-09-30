Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D661C280F76
	for <lists+dm-devel@lfdr.de>; Fri,  2 Oct 2020 11:05:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-F2JDyeeMOsSdHsaYl033Pg-1; Fri, 02 Oct 2020 05:05:40 -0400
X-MC-Unique: F2JDyeeMOsSdHsaYl033Pg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F91E1966338;
	Fri,  2 Oct 2020 09:05:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35E6A1972A;
	Fri,  2 Oct 2020 09:05:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA2BF181A06C;
	Fri,  2 Oct 2020 09:05:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08UB9EGZ018214 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 30 Sep 2020 07:09:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 42037201828A; Wed, 30 Sep 2020 11:09:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D2C4202450A
	for <dm-devel@redhat.com>; Wed, 30 Sep 2020 11:09:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4C75803524
	for <dm-devel@redhat.com>; Wed, 30 Sep 2020 11:09:11 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-118-m5bpeKL1MJCeyr2d4PN0iA-1; Wed, 30 Sep 2020 07:09:09 -0400
X-MC-Unique: m5bpeKL1MJCeyr2d4PN0iA-1
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	08UB1SGk106185
	for <dm-devel@redhat.com>; Wed, 30 Sep 2020 07:09:08 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 33vqm1jq99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <dm-devel@redhat.com>; Wed, 30 Sep 2020 07:09:08 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08UB26TI108902
	for <dm-devel@redhat.com>; Wed, 30 Sep 2020 07:09:08 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
	[159.122.73.72])
	by mx0b-001b2d01.pphosted.com with ESMTP id 33vqm1jq8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 30 Sep 2020 07:09:08 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	08UB96GW021584; Wed, 30 Sep 2020 11:09:06 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma06fra.de.ibm.com with ESMTP id 33svwgt9ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 30 Sep 2020 11:09:06 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
	[9.149.105.59])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 08UB94UE27722104
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 30 Sep 2020 11:09:04 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A5ECA404D;
	Wed, 30 Sep 2020 11:09:04 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E014FA4055;
	Wed, 30 Sep 2020 11:09:03 +0000 (GMT)
Received: from oc4120165700.ibm.com (unknown [9.145.186.1])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 30 Sep 2020 11:09:03 +0000 (GMT)
To: Brian Bunker <brian@purestorage.com>,
	device-mapper development <dm-devel@redhat.com>
References: <D7BC3D02-400E-4F70-9A61-6E959F5AE5A5@purestorage.com>
From: Steffen Maier <maier@linux.ibm.com>
Message-ID: <c2d499b3-b2d1-eaae-bf23-8875b974012a@linux.ibm.com>
Date: Wed, 30 Sep 2020 13:09:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <D7BC3D02-400E-4F70-9A61-6E959F5AE5A5@purestorage.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
	definitions=2020-09-30_06:2020-09-30,
	2020-09-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	malwarescore=0 adultscore=0
	suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
	lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
	mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009300084
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0b-001b2d01.pphosted.com id 08UB1SGk106185
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08UB9EGZ018214
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 02 Oct 2020 04:59:27 -0400
Cc: Benjamin Block <bblock@linux.ibm.com>
Subject: Re: [dm-devel] [PATCH] libmultipath: Extract the LUN number for
 peripheral, flat, and logical unit address methods
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gOS8yOS8yMCAxOjE0IEFNLCBCcmlhbiBCdW5rZXIgd3JvdGU6Cj4gRm9yIExVTnMgYmV0d2Vl
biAwIGFuZCAyNTUgcGVyaXBoZXJhbCBhZGRyZXNzaW5nIGlzIHVzZWQuIEZvciBMVU5zIGhpZ2hl
ciB0aGFuIDI1NSB0aGUgTFVOIGFkZHJlc3NpbmcKPiBzaG91bGQgc3dpdGNoIHRvIGZsYXQgYWNj
b3JkaW5nIHRvIHRoZSBzcGVjaWZpY2F0aW9uLiBJbnN0ZWFkIG9mIHByaW50aW5nIG91dCB0aGUg
TFVOIG51bWJlciB3aXRob3V0IHJlZ2FyZCB0bwo+IHRoZSBzaGlmdGluZyBvZiBhZGRyZXNzIG1l
dGhvZCwgZGlzcGxheSB0aGUgTFVOIGFzIGl0IHdhcyBpbnRlbmRlZCB0byBiZSB0aGUgdXNlciBj
b25uZWN0aW5nIHRoZSBMVU4uIFRoZQo+IGN1cnJlbnQgZGlzcGxheSBsZWF2ZXMgYSBub24tb2J2
aW91cyAxNjM4NCBvZmZzZXQuCj4gCj4gSW4gc2hvcnQsIGEgTFVOIGNvbm5lY3RlZCBhcyAyNTgg
d2lsbCBzaG93IHVwIGluIG11bHRpcGF0aCBvdXRwdXQgYXMgMTY2NDIuIEluc3RlYWQgZGlzcGxh
eSBpdCBhcyB0aGUKPiBleHBlY3RlZCAyNTguIFRoaXMgaXMgZm9yIGRpc3BsYXkgb25seSBhbmQg
ZG9lc27igJl0IGNoYW5nZSB0aGUgYWN0dWFsIGNvbnRlbnRzIG9mIHRoZSBMVU4gdmFyaWFibGUu
CgpbdGhpcyBpcyBraW5kIG9mIGEgY29udGludWF0aW9uIG9mIHRoZSBkaXNjdXNzaW9uIHRoYXQg
c3RhcnRlZCB3aXRoIHRoZSAxc3QgCnZlcnNpb24gb2YgdGhlIHBhdGggaW4gCmh0dHBzOi8vd3d3
LnJlZGhhdC5jb20vYXJjaGl2ZXMvZG0tZGV2ZWwvMjAyMC1TZXB0ZW1iZXIvbXNnMDA1OTIuaHRt
bF0KClVzZXJzIGFuZCB0b29scyBzdWNoIGFzIApodHRwczovL2dpdGh1Yi5jb20vaWJtLXMzOTAt
dG9vbHMvczM5MC10b29scy9ibG9iL21hc3Rlci96aW9tb24vemlvbW9uIHBhcnNlIAp0aGUgaGNp
bCBvdXRwdXQgb2YgbXVsdGlwYXRoKGQpIHRvIGZpbmQgdGhlIGNvcnJlc3BvbmRpbmcgTGludXgg
U0NTSSBkZXZpY2UgYnkgCml0cyB3ZWxsLWRlZmluZWQgbmFtZS4KSSB0aGluayB0aGlzIGNoYW5n
ZSB3b3VsZCBicmVhayB0aG9zZS4KCklJUkMsIHRvb2xzIHN1Y2ggYXMgcmVzY2FuLXNjc2ktYnVz
LnNoIFtzZzNfdXRpbHNdIHdlcmUgaW50ZW50aW9uYWxseSBjaGFuZ2VkIApmcm9tIGRlY29kaW5n
IHRoZSBMVU4gZm9ybWF0IHRvIHdvcmtpbmcgd2l0aCBhbiBvcGFxdWUgNjQtYml0IExVTi4KW2h0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXNjc2kvNTEyODhDNUYuMTA4MDgwMkBzdXNlLmRl
L1QvI21hYmE5NTRmYzUwZWZhMjRlNGMwNTQ0NTA2ZDRjNDAyNTI2OWQ2YzYwXQoKVXNpbmcgdGFy
Z2V0LWludGVybmFsIHZvbHVtZSAibmFtZXMiLCBzdWNoIGFzIHRoZSBwdXJlIExVTiBudW1iZXIs
IGZvciAKY29tbXVuaWNhdGlvbiBiZXR3ZWVuIGluaXRpYXRvciAoTGludXggYWRtaW4pIGFuZCB0
YXJnZXQgKHN0b3JhZ2UgYWRtaW4pIGNhbiAKaW5kZWVkIGJlIGNvbmZ1c2luZy4KVGhlIHRhcmdl
dCBkZWNpZGVzIGhvdyBpdCBleHBvcnRzIGEgdm9sdW1lIHVzaW5nIGEgVDEwIFNBTSA2NC1iaXQg
TFVOIHRoYXQgYm90aCAKaW5pdGF0b3IgYW5kIHRhcmdldCB1bmRlcnN0YW5kIChyZXBvcnQgbHVu
cyBldGMuKS4gVGhhdCdzIHdoYXQgTGludXggZW5jb2RlcyBpbiAKdGhlIHNjc2kgbHVuIHBhcnQg
b2YgYSBTQ1NJIGRldmljZSBuYW1lIFt3aXRoIGEgYmlqZWN0aXZlIG1hcHBpbmcgc3dhcHBpbmcg
dGhlIApvcmRlciBvZiBUMTAgU0FNIExVTiBsZXZlbHNdLgoKSGVyZSdzIGEgcmVhbC1saWZlIGV4
YW1wbGUgbWFraW5nIHVzZSBvZiB0aGUgU0NTSSBkZXZpY2UgbmFtZSB0byBtYXAgZGlmZmVyZW50
IApyZWxhdGVkIG9iamVjdHMgW3NpbWlsYXIgdG8gd2hhdCB0aGUgYWJvdmUtbWVudGlvbmVkIHpp
b21vbiB0b29sIGRvZXNdOgoKIyBtdWx0aXBhdGhkIC1rJ3Nob3cgdG9wbycKMzYwMDUwNzYzMDlm
ZmQ0MzAwMDAwMDAwMDAwMDAxNWY4IGRtLTEgSUJNLDIxMDc5MDAKc2l6ZT0xMEcgZmVhdHVyZXM9
JzEgcXVldWVfaWZfbm9fcGF0aCcgaHdoYW5kbGVyPScxIGFsdWEnIHdwPXJ3CmAtKy0gcG9saWN5
PSdzZXJ2aWNlLXRpbWUgMCcgcHJpbz01MCBzdGF0dXM9YWN0aXZlCiAgIHwtIDA6MDowOjEwOTAw
MTExNTcgc2RoIDg6MTEyIGFjdGl2ZSByZWFkeSBydW5uaW5nCiAgIGAtIDE6MDowOjEwOTAwMTEx
NTcgc2RhIDg6MCAgIGFjdGl2ZSByZWFkeSBydW5uaW5nCgpFLmcuIGZpbmQgdGhlIGNvcnJlc3Bv
bmRpZyBTQ1NJIGdlbmVyaWMgZGV2aWNlOgojIGxzc2NzaSAtZyAwOjA6MDoxMDkwMDExMTU3Clsw
OjA6MDoxMDkwMDExMTU3XSBkaXNrICAgIElCTSAgICAgIDIxMDc5MDAgICAgICAgICAgMi44OCAg
L2Rldi9zZGggICAgL2Rldi9zZzcKCkRlY29kZSB0aGUgTFVOIGZvcm1hdDoKIyBsc3Njc2kgLXgg
LWcgMDowOjA6MTA5MDAxMTE1NwpbMDowOjA6MHg0MDE1XSAgICAgICAgICAgICAgZGlzayAgICBJ
Qk0gICAgICAyMTA3OTAwICAgICAgICAgIDIuODggIC9kZXYvc2RoIAovZGV2L3NnNwoKSnVzdCB1
c2UgdGhlIGZ1bGwgNjQtYml0IExVTiBhcyBhbiBvcGFxdWUgdmFsdWU6CiMgbHNzY3NpIC14eCAt
ZyAwOjA6MDoxMDkwMDExMTU3ClswOjA6MDoweDQwMTU0MGY4MDAwMDAwMDBdICBkaXNrICAgIElC
TSAgICAgIDIxMDc5MDAgICAgICAgICAgMi44OCAgL2Rldi9zZGggCi9kZXYvc2c3Cgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEJyaWFuIEJ1bmtlciA8YnJpYW5AcHVyZXN0b3JhZ2UuY29tPgo+IF9fXwo+
IGRpZmYgLU5hdXIgYS9tdWx0aXBhdGgtdG9vbHMtMC44LjMvbGlibXVsdGlwYXRoL3ByaW50LmMg
Yi9tdWx0aXBhdGgtdG9vbHMtMC44LjMvbGlibXVsdGlwYXRoL3ByaW50LmMKPiAtLS0gYS9saWJt
dWx0aXBhdGgvcHJpbnQuYyAgICAgIDIwMjAtMDktMjQgMTM6NTI6MTguNjYxODI4MDExIC0wNjAw
Cj4gKysrIGIvbGlibXVsdGlwYXRoL3ByaW50LmMgICAgICAyMDIwLTA5LTI4IDE2OjU3OjM3Ljk1
NjIyMjI1OCAtMDYwMAo+IEBAIC0yOSw2ICsyOSw3IEBACj4gICAjaW5jbHVkZSAidWV2ZW50Lmgi
Cj4gICAjaW5jbHVkZSAiZGVidWcuaCIKPiAgICNpbmNsdWRlICJkaXNjb3ZlcnkuaCIKPiArI2lu
Y2x1ZGUgInV0aWwuaCIKPiAgIAo+ICAgI2RlZmluZSBNQVgoeCx5KSAoKCh4KSA+ICh5KSkgPyAo
eCkgOiAoeSkpCj4gICAjZGVmaW5lIE1JTih4LHkpICgoKHgpID4gKHkpKSA/ICh5KSA6ICh4KSkK
PiBAQCAtMzkwLDExICszOTEsMTIgQEAKPiAgICAgICAgICBpZiAoIXBwIHx8IHBwLT5zZ19pZC5o
b3N0X25vIDwgMCkKPiAgICAgICAgICAgICAgICAgIHJldHVybiBzbnByaW50ZihidWZmLCBsZW4s
ICIjOiM6IzojIik7Cj4gICAKPiArICAgICAgIGludCBkaXNwbGF5X2x1biA9IGV4dHJhY3RfbHVu
X251bWJlcihwcC0+c2dfaWQubHVuKTsKPiAgICAgICAgICByZXR1cm4gc25wcmludGYoYnVmZiwg
bGVuLCAiJWk6JWk6JWk6JWkiLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICBwcC0+c2dfaWQu
aG9zdF9ubywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgcHAtPnNnX2lkLmNoYW5uZWwsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgIHBwLT5zZ19pZC5zY3NpX2lkLAo+IC0gICAgICAgICAg
ICAgICAgICAgICAgIHBwLT5zZ19pZC5sdW4pOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGRp
c3BsYXlfbHVuKTsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIGludAo+IGRpZmYgLU5hdXIgYS9tdWx0
aXBhdGgtdG9vbHMtMC44LjMvbGlibXVsdGlwYXRoL3V0aWwuYyBiL211bHRpcGF0aC10b29scy0w
LjguMy9saWJtdWx0aXBhdGgvdXRpbC5jCj4gLS0tIGEvbXVsdGlwYXRoLXRvb2xzLTAuOC4zL2xp
Ym11bHRpcGF0aC91dGlsLmMgMjAxOS0xMC0wMiAwMToxNTowMy4wMDAwMDAwMDAgLTA2MDAKPiAr
KysgYi9tdWx0aXBhdGgtdG9vbHMtMC44LjMvbGlibXVsdGlwYXRoL3V0aWwuYyAyMDIwLTA5LTI4
IDE2OjU2OjAwLjg1MTE2OTA3MCAtMDYwMAo+IEBAIC00NzAsMyArNDcwLDI1IEBACj4gICB7Cj4g
ICAgICAgICAgY2xvc2UoKGxvbmcpYXJnKTsKPiAgIH0KPiArCj4gKy8qIEV4dHJhY3RzIHRoZSBM
VU4gbnVtYmVyIGZyb20gdGhlIGFkZHJlc3NpbmcgbWV0aG9kIGZvcgo+ICsgICBwZXJpcGhlcmFs
LCBmbGF0LCBhbmQgTFVOIGFkZHJlc3NpbmcgbWV0aG9kcy4KPiArICovCj4gK2ludCBleHRyYWN0
X2x1bl9udW1iZXIoaW50IGx1bikKPiArewo+ICsgICAgICAgaWYgKGx1biA+IFVJTlQxNl9NQVgp
Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBsdW47Cj4gKwo+ICsgICAgICAgdWludDhfdCBhZGRy
ZXNzX21ldGhvZCA9ICgobHVuID4+IDgpICYgMHhDMCkgPj4gNjsgLyogZmlyc3QgdHdvIGJpdHMg
b2YgdGhlIDE2IGJ5dGUgTFVOICovCj4gKyAgICAgICBzd2l0Y2ggKGFkZHJlc3NfbWV0aG9kKSB7
Cj4gKyAgICAgICAgICAgICAgIGNhc2UgMTogLyogRmxhdCBBZGRyZXNzaW5nIG1ldGhvZCAoMDFi
KSAqLwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBsdW4gLSAweDQwMDA7Cj4gKyAg
ICAgICAgICAgICAgIGNhc2UgMjogLyogTG9naWNhbCB1bml0IGFkZHJlc3NpbmcgKDAyYikgKi8K
PiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gbHVuICYgMHgwMDFGOwo+ICsgICAgICAg
ICAgICAgICBjYXNlIDA6IC8qIFBlcmlwaGVyYWwgYWRkcmVzc2luZyBtZXRob2QgKDAwYikgKi8K
PiArICAgICAgICAgICAgICAgICAgICAgICBpZiAobHVuID4gMjU1KQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29uZGxvZygzLCAiUGVyaXBoZXJhbCBhZGRyZXNzaW5nIHN1cHBv
cnRzIHVwIHRvIDI1NiBMVU5zIik7Cj4gKyAgICAgICAgICAgICAgIGRlZmF1bHQ6Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIGx1bjsKPiArICAgICAgIH0KPiArfQo+IGRpZmYgLU5h
dXIgYS9tdWx0aXBhdGgtdG9vbHMtMC44LjMvbGlibXVsdGlwYXRoL3V0aWwuaCBiL211bHRpcGF0
aC10b29scy0wLjguMy9saWJtdWx0aXBhdGgvdXRpbC5oCj4gLS0tIGEvbXVsdGlwYXRoLXRvb2xz
LTAuOC4zL2xpYm11bHRpcGF0aC91dGlsLmggMjAxOS0xMC0wMiAwMToxNTowMy4wMDAwMDAwMDAg
LTA2MDAKPiArKysgYi9tdWx0aXBhdGgtdG9vbHMtMC44LjMvbGlibXVsdGlwYXRoL3V0aWwuaCAy
MDIwLTA5LTI4IDE2OjQzOjMyLjYzMjg3OTc2MyAtMDYwMAo+IEBAIC0yMiw2ICsyMiw3IEBACj4g
ICBpbnQgcGFyc2VfcHJrZXlfZmxhZ3MoY2hhciAqcHRyLCB1aW50NjRfdCAqcHJrZXksIHVpbnQ4
X3QgKmZsYWdzKTsKPiAgIGludCBzYWZlX3dyaXRlKGludCBmZCwgY29uc3Qgdm9pZCAqYnVmLCBz
aXplX3QgY291bnQpOwo+ICAgdm9pZCBzZXRfbWF4X2ZkcyhpbnQgbWF4X2Zkcyk7Cj4gK2ludCBl
eHRyYWN0X2x1bl9udW1iZXIoaW50IGx1bik7Cj4gICAKPiAgICNkZWZpbmUgS0VSTkVMX1ZFUlNJ
T04obWFqLCBtaW4sIHB0YykgKCgoKG1haikgKiAyNTYpICsgKG1pbikpICogMjU2ICsgKHB0Yykp
Cj4gICAjZGVmaW5lIEFSUkFZX1NJWkUoeCkgKHNpemVvZih4KS9zaXplb2YoKHgpWzBdKSkKPiAK
PiBCcmlhbiBCdW5rZXIKPiBTVyBFbmcKPiBicmlhbkBwdXJlc3RvcmFnZS5jb20KPiAKPiAKPiAK
PiAKPiAtLQo+IGRtLWRldmVsIG1haWxpbmcgbGlzdAo+IGRtLWRldmVsQHJlZGhhdC5jb20KPiBo
dHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWwKPiAKCgotLSAK
TWl0IGZyZXVuZGxpY2hlbiBHcnVlc3NlbiAvIEtpbmQgcmVnYXJkcwpTdGVmZmVuIE1haWVyCgpM
aW51eCBvbiBJQk0gWiBEZXZlbG9wbWVudAoKaHR0cHM6Ly93d3cuaWJtLmNvbS9wcml2YWN5L3Vz
L2VuLwpJQk0gRGV1dHNjaGxhbmQgUmVzZWFyY2ggJiBEZXZlbG9wbWVudCBHbWJIClZvcnNpdHpl
bmRlciBkZXMgQXVmc2ljaHRzcmF0czogTWF0dGhpYXMgSGFydG1hbm4KR2VzY2hhZWZ0c2Z1ZWhy
dW5nOiBEaXJrIFdpdHRrb3BwClNpdHogZGVyIEdlc2VsbHNjaGFmdDogQm9lYmxpbmdlbgpSZWdp
c3RlcmdlcmljaHQ6IEFtdHNnZXJpY2h0IFN0dXR0Z2FydCwgSFJCIDI0MzI5NAoKCi0tCmRtLWRl
dmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5j
b20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

