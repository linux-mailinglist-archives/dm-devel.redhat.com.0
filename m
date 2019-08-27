Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 676449E7E6
	for <lists+dm-devel@lfdr.de>; Tue, 27 Aug 2019 14:29:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B2A8EC057E9F;
	Tue, 27 Aug 2019 12:29:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EA855C1B2;
	Tue, 27 Aug 2019 12:29:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A138F24F30;
	Tue, 27 Aug 2019 12:29:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7RCSjMk019233 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 27 Aug 2019 08:28:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 23D251001281; Tue, 27 Aug 2019 12:28:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx29.extmail.prod.ext.phx2.redhat.com
	[10.5.110.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7F531001B1A;
	Tue, 27 Aug 2019 12:28:42 +0000 (UTC)
Received: from h3cspam01-ex.h3c.com (smtp.h3c.com [60.191.123.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8895318C892C;
	Tue, 27 Aug 2019 12:28:38 +0000 (UTC)
Received: from DAG2EX06-IDC.srv.huawei-3com.com ([10.8.0.69])
	by h3cspam01-ex.h3c.com with ESMTPS id x7RCSQ5G070875
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Aug 2019 20:28:26 +0800 (GMT-8)
	(envelope-from wu.chongyun@h3c.com)
Received: from DAG2EX06-IDC.srv.huawei-3com.com (10.8.0.69) by
	DAG2EX06-IDC.srv.huawei-3com.com (10.8.0.69) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Tue, 27 Aug 2019 20:28:28 +0800
Received: from BJHUB02-EX.srv.huawei-3com.com (10.63.20.170) by
	DAG2EX06-IDC.srv.huawei-3com.com (10.8.0.69) with Microsoft SMTP Server
	(version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.1.1713.5
	via Frontend Transport; Tue, 27 Aug 2019 20:28:28 +0800
Received: from H3CMLB12-EX.srv.huawei-3com.com ([fe80::10fe:abde:731b:fdde])
	by BJHUB02-EX.srv.huawei-3com.com ([::1]) with mapi id 14.03.0415.000;
	Tue, 27 Aug 2019 20:28:17 +0800
From: Chongyun Wu <wu.chongyun@h3c.com>
To: "Martin Wilck (mwilck@suse.com)" <mwilck@suse.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Thread-Topic: [dm-devel] [PATCH] multipathd: "san_path_err" failure
	optimization
Thread-Index: AdVcg4uVbOPe2ba1T++lUDfUPTCn4g==
Date: Tue, 27 Aug 2019 12:28:14 +0000
Message-ID: <CEB9978CF3252343BE3C67AC9F0086A378D9A799@H3CMLB12-EX.srv.huawei-3com.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.125.108.109]
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: h3cspam01-ex.h3c.com x7RCSQ5G070875
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]);
	Tue, 27 Aug 2019 12:28:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]);
	Tue, 27 Aug 2019 12:28:41 +0000 (UTC) for IP:'60.191.123.56'
	DOMAIN:'smtp.h3c.com' HELO:'h3cspam01-ex.h3c.com'
	FROM:'wu.chongyun@h3c.com' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 60.191.123.56 smtp.h3c.com 60.191.123.56
	smtp.h3c.com <wu.chongyun@h3c.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.70
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7RCSjMk019233
X-loop: dm-devel@redhat.com
Cc: Guozhonghua <guozhonghua@h3c.com>, Changlimin <changlimin@h3c.com>,
	Wangyong <wang.yongD@h3c.com>, Zhangguanghui <zhang.guanghui@h3c.com>
Subject: [dm-devel] [PATCH] multipathd: "san_path_err" failure optimization
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
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Tue, 27 Aug 2019 12:29:19 +0000 (UTC)

SGkgTWFydGluIGFuZCBCZW4sCgpDbG91ZCB5b3UgaGVscCB0byB2aWV3IGJlbG93IHBhdGNoLCB0
aGFua3MuCgo+RnJvbSBhNzEyNmUzM2U3ZWZmOGE5ODU2MDBiNDFiMTcyM2VlNjZiMTgzNTg2IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBDaG9uZ3l1biBXdSA8d3UuY2hvbmd5dW5AaDNj
LmNvbT4KRGF0ZTogVHVlLCAyNyBBdWcgMjAxOSAxMDoyMzo1MCArMDgwMApTdWJqZWN0OiBbUEFU
Q0hdIG11bHRpcGF0aGQ6ICJzYW5fcGF0aF9lcnIiIGZhaWx1cmUgb3B0aW1pemF0aW9uCgpMZXQg
c2FuX3BhdGhfZXJyX3JlY292ZXJ5X3RpbWUgcGF0aCB1bnN0YWJsZSBjYW4gYmUKZGV0ZWN0ZWQg
YW5kIG5vdCByZWluc3RhdGUgaXQgdW50aWwgdGhpcyBwYXRoIGtlZXAgdXAgaW4Kc2FuX3BhdGhf
ZXJyX3JlY292ZXJ5X3RpbWUuIEl0IHdpbGwgZml4IGhlYXZ5IElPIGRlbGF5CmNhdXNlZCBieSBw
YXJ0cyBvZiBwYXRocyBzdGF0ZSBzaGFreSBpbiBtdWx0aXBhdGggZGV2aWNlLgoKVGVzdCBhbmQg
cmVzdWx0OgpSdW4gdXAgZXRoMSAzMHMgYW5kIGRvd24gZXRoMSAzMHMgd2l0aCAxMDAgbG9vcHMg
c2NyaXB0IHRvCm1ha2Ugc29tZSBwYXRocyBzaGFreSBpbiBlYWNoIG11bHRpcGF0aCBkZXZpY2Vz
LgpVc2luZyBiZWxvdyBtdWx0aXBhdGguY29uZiBjb25maWd1cmUgaW4gZGVmYXVsdHMgc2VjdGlv
bjoKICAgIHNhbl9wYXRoX2Vycl9yZWNvdmVyeV90aW1lIDMwCiAgICBzYW5fcGF0aF9lcnJfdGhy
ZXNob2xkIDIKICAgIHNhbl9wYXRoX2Vycl9mb3JnZXRfcmF0ZSA2CkFmdGVyIHRlc3QsIG5vdCBm
b3VuZCBhbnkgSU8gZGVsYXkgbG9ncyBleGNlcHQgc2V2ZXJhbCBsb2dzIGluIHRoZSB2ZXJ5CmJl
Z2lubmluZyB3aGljaCBiZWZvcmUgc2FuX3BhdGhfZXJyIGZpbHRlciBzaGFreSBwYXRoIHdvcmtz
IC4KSWYgd2l0aG91dCBhYm92ZSBjb25maWcgYW5kIHRoaXMgcGF0Y2ggdGhlcmUgd2lsbCBiZSBs
b3RzIG9mIElPIGRlbGF5CmluIHN5c2xvZyBhbmQgc29tZSBwYXRocyBzdGF0ZSBjaGFuZ2UgZnJv
bSB1cCB0byBkb3duIGFnYWluIGFuZCBhZ2Fpbi4KClNpZ25lZC1vZmYtYnk6IENob25neXVuIFd1
IDx3dS5jaG9uZ3l1bkBoM2MuY29tPgotLS0KIG11bHRpcGF0aGQvbWFpbi5jIHwgMTcgKysrKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvbXVsdGlwYXRoZC9tYWluLmMgYi9tdWx0aXBhdGhkL21haW4uYwppbmRleCA3YTVjZDExLi44
YWNkMDgwIDEwMDY0NAotLS0gYS9tdWx0aXBhdGhkL21haW4uYworKysgYi9tdWx0aXBhdGhkL21h
aW4uYwpAQCAtMTg5Nyw2ICsxODk3LDE4IEBAIHN0YXRpYyBpbnQgY2hlY2tfcGF0aF9yZWluc3Rh
dGVfc3RhdGUoc3RydWN0IHBhdGggKiBwcCkgewogCQkJY29uZGxvZygyLCAiJXMgOiByZWluc3Rh
dGluZyBwYXRoIGVhcmx5IiwgcHAtPmRldik7CiAJCQlnb3RvIHJlaW5zdGF0ZV9wYXRoOwogCQl9
CisKKwkJLyogSWYgcGF0aCBiZWNhbWUgZmFpbGVkIGFnYWluIG9yIGNvbnRpbnVlIGZhaWxlZCwg
c2hvdWxkIHJlc2V0CisJCSAqIHBhdGggc2FuX3BhdGhfZXJyX2ZvcmdldF9yYXRlIGFuZCBwYXRo
IGRpc19yZWluc3RhdGVfdGltZSB0bworCQkgKiBzdGFydCBhIG5ldyBzdGFibGUgY2hlY2suIAor
CQkgKi8KKwkJaWYgKChwcC0+c3RhdGUgIT0gUEFUSF9VUCkgJiYgKHBwLT5zdGF0ZSAhPSBQQVRI
X0dIT1NUKSAmJgorCQkJKHBwLT5zdGF0ZSAhPSBQQVRIX0RFTEFZRUQpKSB7CisJCQlwcC0+c2Fu
X3BhdGhfZXJyX2ZvcmdldF9yYXRlID0KKwkJCQlwcC0+bXBwLT5zYW5fcGF0aF9lcnJfZm9yZ2V0
X3JhdGU7CisJCQlwcC0+ZGlzX3JlaW5zdGF0ZV90aW1lID0gY3Vycl90aW1lLnR2X3NlYzsKKwkJ
fQorCiAJCWlmICgoY3Vycl90aW1lLnR2X3NlYyAtIHBwLT5kaXNfcmVpbnN0YXRlX3RpbWUgKSA+
IHBwLT5tcHAtPnNhbl9wYXRoX2Vycl9yZWNvdmVyeV90aW1lKSB7CiAJCQljb25kbG9nKDIsIiVz
IDogcmVpbnN0YXRlIHRoZSBwYXRoIGFmdGVyIGVyciByZWNvdmVyeSB0aW1lIiwgcHAtPmRldik7
CiAJCQlnb3RvIHJlaW5zdGF0ZV9wYXRoOwpAQCAtMjEwNiw2ICsyMTE4LDExIEBAIGNoZWNrX3Bh
dGggKHN0cnVjdCB2ZWN0b3JzICogdmVjcywgc3RydWN0IHBhdGggKiBwcCwgaW50IHRpY2tzKQog
CQkJY2hlY2tfcGF0aF9yZWluc3RhdGVfc3RhdGUocHApKSB7CiAJCXBwLT5zdGF0ZSA9IFBBVEhf
REVMQVlFRDsKIAkJcmV0dXJuIDE7CisJfSBlbHNlIGlmICgobmV3c3RhdGUgIT0gUEFUSF9VUCAm
JiBuZXdzdGF0ZSAhPSBQQVRIX0dIT1NUKSAmJgorCQkJKHBwLT5zdGF0ZSA9PSBQQVRIX0RFTEFZ
RUQpKSB7CisJCS8qIElmIHBhdGggc3RhdGUgYmVjb21lIGZhaWxlZCBhZ2FpbiBjYW5jZWwgcGF0
aCBkZWxheSBzdGF0ZSAqLworCQlwcC0+c3RhdGUgPSBuZXdzdGF0ZTsKKwkJcmV0dXJuIDE7CiAJ
fQogCiAJaWYgKChuZXdzdGF0ZSA9PSBQQVRIX1VQIHx8IG5ld3N0YXRlID09IFBBVEhfR0hPU1Qp
ICYmCi0tIAoKQmVzdCBSZWdhcmRzo6wKQ2hvbmd5dW4gV3UKCgotLQpkbS1kZXZlbCBtYWlsaW5n
IGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4v
bGlzdGluZm8vZG0tZGV2ZWw=
