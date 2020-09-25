Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7131E27BE73
	for <lists+dm-devel@lfdr.de>; Tue, 29 Sep 2020 09:55:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-QlNtLmPjPuCiYVQ_XbmBsg-1; Tue, 29 Sep 2020 03:55:26 -0400
X-MC-Unique: QlNtLmPjPuCiYVQ_XbmBsg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B85EA186DD23;
	Tue, 29 Sep 2020 07:55:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A249619D61;
	Tue, 29 Sep 2020 07:55:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A459A44A56;
	Tue, 29 Sep 2020 07:55:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08PEEIIH013173 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Sep 2020 10:14:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1B1672142F4A; Fri, 25 Sep 2020 14:14:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 154A62142F4B
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 14:14:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAC52101AA41
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 14:14:14 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-149-d-nTa7ywO_qQqSURwAmeSQ-1; Fri, 25 Sep 2020 10:14:12 -0400
X-MC-Unique: d-nTa7ywO_qQqSURwAmeSQ-1
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	08PE1aPG037046
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 10:14:12 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 33shap1m50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 10:14:11 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08PE5FAb049371
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 10:14:11 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
	[159.122.73.70])
	by mx0b-001b2d01.pphosted.com with ESMTP id 33shap1m47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 25 Sep 2020 10:14:11 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	08PEDiZJ013520; Fri, 25 Sep 2020 14:14:09 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
	(d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma01fra.de.ibm.com with ESMTP id 33n9m7ua94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 25 Sep 2020 14:14:09 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 08PEE7Eh23658758
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 25 Sep 2020 14:14:07 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 101C55204F;
	Fri, 25 Sep 2020 14:14:07 +0000 (GMT)
Received: from oc4120165700.ibm.com (unknown [9.145.148.62])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D6C4D52050;
	Fri, 25 Sep 2020 14:14:06 +0000 (GMT)
To: Brian Bunker <brian@purestorage.com>,
	device-mapper development <dm-devel@redhat.com>
References: <04F146B1-3EB2-42C0-87EA-E0EABC3D8020@purestorage.com>
From: Steffen Maier <maier@linux.ibm.com>
Message-ID: <495bf574-1f2f-a281-96e5-c7631b0f07f0@linux.ibm.com>
Date: Fri, 25 Sep 2020 16:14:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <04F146B1-3EB2-42C0-87EA-E0EABC3D8020@purestorage.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
	definitions=2020-09-25_11:2020-09-24,
	2020-09-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	mlxscore=0 spamscore=0
	bulkscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0 adultscore=0
	malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
	lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009250095
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0b-001b2d01.pphosted.com id 08PE1aPG037046
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08PEEIIH013173
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 29 Sep 2020 03:54:59 -0400
Subject: Re: [dm-devel] Make LUNs higher than 255 more friendly to look at
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

SGkgQnJpYW4sCgpPbiA5LzI0LzIwIDExOjEwIFBNLCBCcmlhbiBCdW5rZXIgd3JvdGU6Cj4gRm9y
IExVTnMgYmV0d2VlbiAwIGFuZCAyNTUgcGVyaXBoZXJhbCBhZGRyZXNzaW5nIGlzIHVzZWQuIEZv
ciBMVU5zIGhpZ2hlciB0aGFuIDI1NSB0aGUgTFVOIGFkZHJlc3NpbmcKPiBzaG91bGQgc3dpdGNo
IHRvIGZsYXQgYWNjb3JkaW5nIHRvIHRoZSBzcGVjaWZpY2F0aW9uLiBJbnN0ZWFkIG9mIHByaW50
aW5nIG91dCB0aGUgTFVOIG51bWJlciB3aXRob3V0IHJlZ2FyZCB0bwo+IHRoZSBzaGlmdGluZyBv
ZiBhZGRyZXNzIG1ldGhvZCwgZGlzcGxheSB0aGUgTFVOIGFzIGl0IHdhcyBpbnRlbmRlZCB0byBi
ZSB0aGUgdXNlciBjb25uZWN0aW5nIHRoZSBMVU4uIFRoZQo+IGN1cnJlbnQgZGlzcGxheSBsZWF2
ZXMgYSBub24tb2J2aW91cyAxNjM4NCBvZmZzZXQuCj4gCj4gSW4gc2hvcnQsIGEgTFVOIGNvbm5l
Y3RlZCBhcyAyNTggd2lsbCBzaG93IHVwIGluIG11bHRpcGF0aCBvdXRwdXQgYXMgMTY2NDIuIElu
c3RlYWQgZGlzcGxheSBpdCBhcyB0aGUKPiBleHBlY3RlZCAyNTguIFRoaXMgaXMgZm9yIGRpc3Bs
YXkgb25seSBhbmQgZG9lc27igJl0IGNoYW5nZSB0aGUgYWN0dWFsIGNvbnRlbnRzIG9mIHRoZSBM
VU4gdmFyaWFibGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gQnVua2VyIDxicmlhbkBwdXJl
c3RvcmFnZS5jb20+Cj4gX19fCj4gLS0tIGEvbGlibXVsdGlwYXRoL3ByaW50LmMgICAgICAyMDIw
LTA5LTI0IDEzOjUyOjE4LjY2MTgyODAxMSAtMDYwMAo+ICsrKyBiL2xpYm11bHRpcGF0aC9wcmlu
dC5jICAgICAgMjAyMC0wOS0yNCAxNDoyODoyNy42MDM1NDIzMDMgLTA2MDAKPiBAQCAtMzk0LDcg
KzM5NCw3IEBACj4gICAgICAgICAgICAgICAgICAgICAgICAgIHBwLT5zZ19pZC5ob3N0X25vLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICBwcC0+c2dfaWQuY2hhbm5lbCwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgcHAtPnNnX2lkLnNjc2lfaWQsCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgcHAtPnNnX2lkLmx1bik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgKHBwLT5zZ19pZC5s
dW4gJiAweDQwMDApID8gcHAtPnNnX2lkLmx1biAtIDB4NDAwMCA6IHBwLT5zZ19pZC5sdW4pOwo+
ICAgfQo+IAo+ICAgc3RhdGljIGludAoKRm9yIExpbnV4IFNDU0kgZGV2aWNlcywgYW5kIGlmIEkg
dW5kZXJzdG9vZCB0aGUgY29kZSBjb3JyZWN0bHkgCltsaWJtdWx0aXBhdGgvZGlzY292ZXJ5LmM6
c2NzaV9zeXNmc19wYXRoaW5mbygpXSwgdGhpcyBzZWVtcyB0aGUgU0NTSSBMVU4gdmFsdWUgCmJl
aW5nIHBhcnQgb2YgdGhlIFNDU0kgZGV2aWNlIG5hbWUgaW4gaXRzIEg6QzpUOkwgZm9ybWF0LiBB
RkFJSywgTGludXggCmludGVudGlvbmFsbHkgdHJlYXRzIHRoaXMgYXMgYW4gb3BhcXVlIDY0LWJp
dCB2YWx1ZSB0byByZWZsZWN0IGEgVDEwIFNBTSBMVU4gClthcyBkZWNpbWFsIG51bWJlciB3aXRo
IHJldmVyc2VkIExVTiBsZXZlbHMsIHRob3VnaCwgc28gYSBwZXJpcGhlcmFsIGFkZHJlc3Npbmcg
CkxVTiBoYXBwZW5zIHRvIGxvb2sgbGlrZSBhIHNtYWxsIGludGVnZXIgdmFsdWVdLiBUaGlzIHdh
eSwgaXQgYWx3YXlzIHdvcmtzIHdpdGggCmFueSAoY3VycmVudCBvciBmdXR1cmUpIExVTiBmb3Jt
YXQgYW5kIGl0cyBwb3RlbnRpYWxseSBkaWZmZXJlbnQgTFVOIGZvcm1hdCAKZmllbGRzL3BhcnRz
LgoKVXNlcnMgbWF5IHVzZSB0aGUgaGNpbCBvdXRwdXQgdG8gZmluZCB0aGUgY29ycmVzcG9uZGlu
ZyBMaW51eCBTQ1NJIGRldmljZSBieSAKaXRzIG5hbWUuIFdvdWxkIHRoaXMgc3RpbGwgd29yayBp
ZiB0aGUgb3V0cHV0IHZhbHVlIHdhcyBtb2RpZmllZD8KCkFsc28sIHNvbWUgKEZDUC1hdHRhY2hl
ZCBTQ1NJKSBzdG9yYWdlcyBpbiBwYXJ0aWN1bGFyIGNhc2VzIHVzZSBMVU4gZm9ybWF0IApmaWVs
ZHMgaW4gYWRkaXRpb24gdG8gIi4uLiBMVU4iIHRvIGNvZGUgYSBsYXJnZXIgc29tZXdoYXQgb3Bh
cXVlIDY0LWJpdCBUMTAgU0FNIApMVU4gdmFsdWUuIEZvciBpbnN0YW5jZSAiQlVTIElERU5USUZJ
RVIiIHdpdGggcGVyaXBoZXJhbCBhZGRyZXNzaW5nLCBvciBhIApub24temVybyAybmQgbGV2ZWwg
d2l0aCBmbGF0IHNwYWNlIGFkZHJlc3NpbmcuIEFib3ZlIGNvbnZlcnNpb24gc2VlbXMgdG8gYXQg
CmxlYXN0IHJlc3VsdCBpbiB1bmV4cGVjdGVkIHZhbHVlcy4KCigoTm90IHN1cmUgZm9yIHRoaXMg
Y2FzZSwgYXMgTlZNZSBtaWdodCB1c2UgaXRzIG93biBwcmludCBvdXRwdXQgY29kZSBpbiAKbGli
bXVsdGlwYXRoL2ZvcmVpZ24vbnZtZS5jOiBudm1lX3N5c2ZzX3BhdGhpbmZvKCkgc2VlbXMgdG8g
YmUgYW5vdGhlciB1c2VyIAphc3NpZ25pbmcgYSBub24temVybyB2YWx1ZSB0byBzZ19pZC5sdW4g
W29yaWdpbmF0aW5nIGluIHRoZSBuc2lkIAoobmFtZXNwYWNlLUlEPyldLiBBbiB1bmNvbmRpdGlv
bmFsIHZhbHVlIGNvbnZlcnNpb24gaW4gdGhlIG91dHB1dCBwcmludGluZyBjb2RlIApwYXRoIGJh
c2VkIG9uIFNDU0kga25vd2xlZGdlIG1pZ2h0IGJyZWFrIG91dHB1dCBvZiB2YWx1ZXMgYmVsb25n
aW5nIHRvIE5WTWUgCnBhdGhzLikpCgotLSAKTWl0IGZyZXVuZGxpY2hlbiBHcnVlc3NlbiAvIEtp
bmQgcmVnYXJkcwpTdGVmZmVuIE1haWVyCgpMaW51eCBvbiBJQk0gWiBEZXZlbG9wbWVudAoKaHR0
cHM6Ly93d3cuaWJtLmNvbS9wcml2YWN5L3VzL2VuLwpJQk0gRGV1dHNjaGxhbmQgUmVzZWFyY2gg
JiBEZXZlbG9wbWVudCBHbWJIClZvcnNpdHplbmRlciBkZXMgQXVmc2ljaHRzcmF0czogTWF0dGhp
YXMgSGFydG1hbm4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBEaXJrIFdpdHRrb3BwClNpdHogZGVyIEdl
c2VsbHNjaGFmdDogQm9lYmxpbmdlbgpSZWdpc3RlcmdlcmljaHQ6IEFtdHNnZXJpY2h0IFN0dXR0
Z2FydCwgSFJCIDI0MzI5NAoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRo
YXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

