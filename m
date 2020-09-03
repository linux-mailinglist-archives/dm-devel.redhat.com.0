Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9FAEF25C9FD
	for <lists+dm-devel@lfdr.de>; Thu,  3 Sep 2020 22:09:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-h_StipwwPoih5VCZN7m-9w-1; Thu, 03 Sep 2020 16:09:53 -0400
X-MC-Unique: h_StipwwPoih5VCZN7m-9w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3B6C185A0C3;
	Thu,  3 Sep 2020 20:09:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11829672C6;
	Thu,  3 Sep 2020 20:09:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB8A61826D2A;
	Thu,  3 Sep 2020 20:09:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 083K987n010953 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Sep 2020 16:09:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C3F082156A2D; Thu,  3 Sep 2020 20:09:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF54C2156A23
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 20:09:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F95580029D
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 20:09:06 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-6-scJD750qP0e43VV3bIOmqQ-1;
	Thu, 03 Sep 2020 16:09:03 -0400
X-MC-Unique: scJD750qP0e43VV3bIOmqQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 41301AC24;
	Thu,  3 Sep 2020 20:08:55 +0000 (UTC)
Message-ID: <73d14f51e1ca6aeb8dbd40f5a22c21508b6d4401.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Christophe Varoqui <christophe.varoqui@opensvc.com>,
	dm-devel mailing list <dm-devel@redhat.com>
Date: Thu, 03 Sep 2020 22:08:53 +0200
In-Reply-To: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 00/14] multipath-tools series: some cleanups
 and fixes checked by codedex tool
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="=-uonpg43clZDklqTjNC2Y"

--=-uonpg43clZDklqTjNC2Y
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit

Hello Lixiaokeng,

On Wed, 2020-09-02 at 14:40 +0800, lixiaokeng wrote:
> Hi:
>     Now, we check multipath-tools codes with codedex tool. Here
> are some some cleanups and fixes.

Thank you. However I'm going to nack all patches that add error
messages after unsuccesful memory allocations. Such messages are
unhelpful most of the time, and increase the code size without a true
benefit. I've actually considered to get rid of all these, and replace
them by a log_oom() macro.

See an untested prototype attached, to better understand what I mean.

Regards
Martin



--=-uonpg43clZDklqTjNC2Y
Content-Disposition: attachment;
	filename="0001-libmultipath-prototype-implementation-of-log_oom.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch;
	name="0001-libmultipath-prototype-implementation-of-log_oom.patch";
	charset="ISO-8859-15"

RnJvbSBmYmJjYTJjNTA3NmE0ODllZTRhZTY0M2Q2ZDkxOTljYTUwODViZTk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJ0aW4gV2lsY2sgPG13aWxja0BzdXNlLmNvbT4KRGF0ZTog
VGh1LCAzIFNlcCAyMDIwIDIyOjAzOjIyICswMjAwClN1YmplY3Q6IFtQQVRDSF0gbGlibXVsdGlw
YXRoOiBwcm90b3R5cGUgaW1wbGVtZW50YXRpb24gb2YgbG9nX29vbSgpCgpSYXRpb25hbGU6IHdp
dGggVkVSQk9TRV9PT01fTE9HR0lORywgd2UgbG9nIHRoZSBwYXJ0IG9mIHRoZSBjb2RlCndoZXJl
IE9PTSBvY2N1cmVkLCB3aXRoIG1pbmltYWwgcnVudGltZSBlZmZvcnQgKG5vIHN0cmluZyBmb3Jt
YXR0aW5nKS4KV2l0aCBsb3RzIG9mIGxvZ19vb20oKSBpbnZvY2F0aW9ucywgb3VyIGJpbmFyeSB3
aWxsIGluY3JlYXNlIGJ5IG1hbnkKc3RhdGljIHN0cmluZ3MuIFdpdGhvdXQgVkVSQk9TRV9PT01f
TE9HR0lORywgd2UganVzdCBwcmludCBhIG1pbmltYWwKZXJyb3IgbWVzc2FnZSwgd2hpY2ggd2ls
bCBiZSBlbm91Z2ggbW9zdCBvZiB0aGUgdGltZS4KClNpZ25lZC1vZmYtYnk6IE1hcnRpbiBXaWxj
ayA8bXdpbGNrQHN1c2UuY29tPgotLS0KIGxpYm11bHRpcGF0aC9kZWJ1Zy5jIHwgNyArKysrKysr
CiBsaWJtdWx0aXBhdGgvZGVidWcuaCB8IDggKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTUg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpYm11bHRpcGF0aC9kZWJ1Zy5jIGIvbGlibXVs
dGlwYXRoL2RlYnVnLmMKaW5kZXggNDEyOGNiOS4uOTA2MjU4MSAxMDA2NDQKLS0tIGEvbGlibXVs
dGlwYXRoL2RlYnVnLmMKKysrIGIvbGlibXVsdGlwYXRoL2RlYnVnLmMKQEAgLTQ4LDMgKzQ4LDEw
IEBAIHZvaWQgZGxvZyAoaW50IHNpbmssIGludCBwcmlvLCBjb25zdCBjaGFyICogZm10LCAuLi4p
CiAJfQogCXZhX2VuZChhcCk7CiB9CisKKyNpZm5kZWYgVkVSQk9TRV9PT01fTE9HR0lORwordm9p
ZCBsb2dfb29tKHZvaWQpCit7CisJY29uZGxvZygwLCAiT3V0IG9mIG1lbW9yeSIpOworfQorI2Vu
ZGlmCmRpZmYgLS1naXQgYS9saWJtdWx0aXBhdGgvZGVidWcuaCBiL2xpYm11bHRpcGF0aC9kZWJ1
Zy5oCmluZGV4IGM2MTIwYzEuLmY2MWVjYjYgMTAwNjQ0Ci0tLSBhL2xpYm11bHRpcGF0aC9kZWJ1
Zy5oCisrKyBiL2xpYm11bHRpcGF0aC9kZWJ1Zy5oCkBAIC0xMSwzICsxMSwxMSBAQCBleHRlcm4g
aW50IGxvZ3Npbms7CiAKICNkZWZpbmUgY29uZGxvZyhwcmlvLCBmbXQsIGFyZ3MuLi4pIFwKIAlk
bG9nKGxvZ3NpbmssIHByaW8sIGZtdCAiXG4iLCAjI2FyZ3MpCisKKyNpZmRlZiBWRVJCT1NFX09P
TV9MT0dHSU5HCisjZGVmaW5lIF9fbG9nX29vbShmaWxlLCBsaW5lKSBjb25kbG9nKDAsICJPdXQg
b2YgbWVtb3J5IGluICIgZmlsZSAiOiIgI2xpbmUpCisjZGVmaW5lIF9sb2dfb29tKGZpbGUsIGxp
bmUpIF9fbG9nX29vbShmaWxlLCBsaW5lKQorI2RlZmluZSBsb2dfb29tKCkgX2xvZ19vb20oX19G
SUxFX18sIF9fTElORV9fKQorI2Vsc2UKK3ZvaWQgbG9nX29vbSh2b2lkKTsKKyNlbmRpZgotLSAK
Mi4yOC4wCgo=
--=-uonpg43clZDklqTjNC2Y
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--=-uonpg43clZDklqTjNC2Y--

