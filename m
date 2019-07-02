Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC3A5D0A3
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jul 2019 15:27:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6986BA3B63;
	Tue,  2 Jul 2019 13:27:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 115EF19C6F;
	Tue,  2 Jul 2019 13:27:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3CD37206D2;
	Tue,  2 Jul 2019 13:27:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x62DORtA023946 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jul 2019 09:24:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0B35D4D749; Tue,  2 Jul 2019 13:24:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 831335C28D;
	Tue,  2 Jul 2019 13:24:22 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D34C88306;
	Tue,  2 Jul 2019 13:23:53 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 87E0E767180E0E09C15A;
	Tue,  2 Jul 2019 21:23:49 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS402-HUB.china.huawei.com
	(10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Tue, 2 Jul 2019
	21:23:41 +0800
From: Hou Tao <houtao1@huawei.com>
To: <linux-raid@vger.kernel.org>, <songliubraving@fb.com>
Date: Tue, 2 Jul 2019 21:29:15 +0800
Message-ID: <20190702132918.114818-1-houtao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.28]); Tue, 02 Jul 2019 13:24:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Tue, 02 Jul 2019 13:24:02 +0000 (UTC) for IP:'45.249.212.35'
	DOMAIN:'szxga07-in.huawei.com' HELO:'huawei.com'
	FROM:'houtao1@huawei.com' RCPT:''
X-RedHat-Spam-Score: -0.002  (SPF_HELO_PASS,
	SPF_PASS) 45.249.212.35 szxga07-in.huawei.com
	45.249.212.35 szxga07-in.huawei.com <houtao1@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com, neilb@suse.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	houtao1@huawei.com, agk@redhat.com
Subject: [dm-devel] [RFC PATCH 0/3] md: export internal stats through debugfs
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Tue, 02 Jul 2019 13:27:18 +0000 (UTC)

SGksCgpUaGVyZSBhcmUgc28gbWFueSBpbyBjb3VudGVycywgc3RhdHMgYW5kIGZsYWdzIGluIG1k
LCBzbyBJIHRoaW5rCmV4cG9ydCB0aGVzZSBpbmZvIHRvIHVzZXJzcGFjZSB3aWxsIGJlIGhlbHBm
dWwgZm9yIG9ubGluZS1kZWJ1Z2dpbmcsCmVzcGVjaWFsbHkgd2hlbiB0aGUgdm1saW51eCBmaWxl
IGFuZCB0aGUgY3Jhc2ggdXRpbGl0eSBhcmUgbm90CmF2YWlsYWJsZS4gQW5kIHRoZXNlIGluZm8g
Y2FuIGFsc28gYmUgdXRpbGl6ZWQgZHVyaW5nIGNvZGUKdW5kZXJzdGFuZGluZy4KCk1EIGhhcyBh
bHJlYWR5IGV4cG9ydGVkIHNvbWUgc3RhdHMgdGhyb3VnaCBzeXNmcyBmaWxlcyB1bmRlcgovc3lz
L2Jsb2NrL21kWC9tZCwgYnV0IHVzaW5nIHN5c2ZzIGZpbGUgdG8gZXhwb3J0IG1vcmUgaW50ZXJu
YWwKc3RhdHMgYXJlIG5vdCBhIGdvb2QgY2hvaWNlLCBiZWNhdXNlIHdlIG5lZWQgdG8gY3JlYXRl
IGEgc2luZ2xlCnN5c2ZzIGZpbGUgZm9yIGVhY2ggaW50ZXJuYWwgc3RhdCBhY2NvcmRpbmcgdG8g
dGhlIHVzZSBjb252ZW50aW9uCm9mIHN5c2ZzIGFuZCB0aGVyZSBhcmUgdG9vIG1hbnkgaW50ZXJu
YWwgc3RhdHMuIEZ1cnRoZXIsIHRoZQpuZXdseS1jcmVhdGVkIHN5c2ZzIGZpbGVzIHdvdWxkIGJl
Y29tZSBBUElzIGZvciB1c2Vyc3BhY2UgdG9vbHMsCmJ1dCB0aGF0IGlzIG5vdCB3ZSB3YW50ZWQs
IGJlY2F1c2UgdGhlc2UgZmlsZXMgYXJlIHJlbGF0ZWQgd2l0aAppbnRlcm5hbCBzdGF0cyBhbmQg
aW50ZXJuYWwgc3RhdHMgbWF5IGNoYW5nZSBmcm9tIHRpbWUgdG8gdGltZS4KCkFuZCBJIHRoaW5r
IGRlYnVnZnMgaXMgYSBiZXR0ZXIgY2hvaWNlLiBCZWNhdXNlIHdlIGNhbiBzaG93IG11bHRpcGxl
CnJlbGF0ZWQgc3RhdHMgaW4gYSBkZWJ1Z2ZzIGZpbGUsIGFuZCB0aGUgZGVidWdmcyBmaWxlIHdp
bGwgbmV2ZXIgYmUKdXNlZCBhcyBhbiB1c2Vyc3BhY2UgQVBJLgoKVHdvIGRlYnVnZnMgZmlsZXMg
YXJlIGNyZWF0ZWQgdG8gZXhwb3NlIHRoZXNlIGludGVybmFsIHN0YXRzOgoqIGlvc3RhdDogaW8g
Y291bnRlcnMgYW5kIGlvIHJlbGF0ZWQgc3RhdHMgKGUuZy4sIG1kZGV2LT5hY3RpdmVfaW8sCgly
MWNvbmYtPm5yX3BlbmRpbmcsIG9yIHIxY29uZmktPnJldHJ5X2xpc3QpCiogc3RhdDogbm9ybWFs
IHN0YXRzL2ZsYWdzIChlLmcuLCBtZGRldi0+cmVjb3ZlcnksIGNvbmYtPmFycmF5X2Zyb3plbikK
CkJlY2F1c2UgaW50ZXJuYWwgc3RhdHMgYXJlIHNwcmVhZGVkIGFsbCBvdmVyIG1kLWNvcmUgYW5k
IG1kLXBlcnNvbmFsaXR5LApzbyBib3RoIG1kLWNvcmUgYW5kIG1kLXBlcnNvbmFsaXR5IHdpbGwg
Y3JlYXRlIHRoZXNlIHR3byBkZWJ1Z2ZzIGZpbGVzCnVuZGVyIGRpZmZlcmVudCBkZWJ1Z2ZzIGRp
cmVjdG9yeS4KClBhdGNoIDEgZmFjdG9ycyBvdXQgdGhlIGRlYnVnZnMgZmlsZXMgY3JlYXRpb24g
cm91dGluZSBmb3IgbWQtY29yZSBhbmQKbWQtcGVyc29uYWxpdHksIHBhdGNoIDIgY3JlYXRlcyB0
d28gZGVidWdmcyBmaWxlczogaW9zdGF0ICYgc3RhdCB1bmRlcgovc3lzL2tlcm5lbC9kZWJ1Zy9i
bG9jay9tZFggZm9yIG1kLWNvcmUsIGFuZCBwYXRjaCAzIGNyZWF0ZXMgdHdvIGRlYnVnZnMKZmls
ZXM6IGlvc3RhdCAmIHN0YXQgdW5kZXIgL3N5cy9rZXJuZWwvZGVidWcvYmxvY2svbWRYL3JhaWQx
IGZvciBtZC1yYWlkMS4KClRoZSBmb2xsb3dpbmcgbGluZXMgc2hvdyB0aGUgaGllcmFyY2h5IGFu
ZCB0aGUgY29udGVudCBvZiB0aGVzZSBkZWJ1Z2ZzCmZpbGVzIGZvciBhIFJBSUQxIGRldmljZToK
CiQgcHdkCi9zeXMva2VybmVsL2RlYnVnL2Jsb2NrL21kMAokIHRyZWUKLgrilJzilIDilIAgaW9z
dGF0CuKUnOKUgOKUgCByYWlkMQrilILCoMKgIOKUnOKUgOKUgCBpb3N0YXQK4pSCwqDCoCDilJTi
lIDilIAgc3RhdArilJTilIDilIAgc3RhdAoKJCBjYXQgaW9zdGF0CmFjdGl2ZV9pbyAwCnNiX3dh
aXQgMCBwZW5kaW5nX3dyaXRlcyAwCnJlY292ZXJ5X2FjdGl2ZSAwCmJpdG1hcCBwZW5kaW5nX3dy
aXRlcyAwCgokIGNhdCBzdGF0CmZsYWdzIDB4MjAKc2JfZmxhZ3MgMHgwCnJlY292ZXJ5IDB4MAoK
JCBjYXQgcmFpZDEvaW9zdGF0CnJldHJ5X2xpc3QgYWN0aXZlIDAKYmlvX2VuZF9pb19saXN0IGFj
dGl2ZSAwCnBlbmRpbmdfYmlvX2xpc3QgYWN0aXZlIDAgY250IDAKc3luY19wZW5kaW5nIDAKbnJf
cGVuZGluZyAwCm5yX3dhaXRpbmcgMApucl9xdWV1ZWQgMApiYXJyaWVyIDAKCiQgY2F0IHJhaWQx
L3N0YXQKYXJyYXlfZnJvemVuIDAKCkknbSBub3Qgc3VyZSB3aGV0aGVyIHRoZSBkaXZpc2lvbiBv
ZiBpbnRlcm5hbCBzdGF0cyBpcyBhcHByb3ByaWF0ZSBhbmQKd2hldGhlciB0aGUgaW50ZXJuYWwg
c3RhdHMgaW4gZGVidWdmcyBmaWxlcyBhcmUgc3VmZmljaWVudCwgc28gcXVlc3Rpb25zCmFuZCBj
b21tZW50cyBhcmUgd2VjbG9tZS4KClJlZ2FyZHMsClRhbwoKSG91IFRhbyAoMyk6CiAgbWQtZGVi
dWdmczogYWRkIG1kX2RlYnVnZnNfY3JlYXRlX2ZpbGVzKCkKICBtZDogZXhwb3J0IGluZmxpZ2h0
IGlvIGNvdW50ZXJzIGFuZCBpbnRlcm5hbCBzdGF0cyBpbiBkZWJ1Z2ZzCiAgcmFpZDE6IGV4cG9y
dCBpbmZsaWdodCBpbyBjb3VudGVycyBhbmQgaW50ZXJuYWwgc3RhdHMgaW4gZGVidWdmcwoKIGRy
aXZlcnMvbWQvTWFrZWZpbGUgICAgIHwgIDIgKy0KIGRyaXZlcnMvbWQvbWQtZGVidWdmcy5jIHwg
MzUgKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL21kL21kLWRlYnVnZnMuaCB8IDE2ICsrKysr
KysrKwogZHJpdmVycy9tZC9tZC5jICAgICAgICAgfCA2NSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCiBkcml2ZXJzL21kL21kLmggICAgICAgICB8ICAxICsKIGRyaXZlcnMvbWQv
cmFpZDEuYyAgICAgIHwgNzggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKIGRyaXZlcnMvbWQvcmFpZDEuaCAgICAgIHwgIDEgKwogNyBmaWxlcyBjaGFuZ2VkLCAxOTcg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
bWQvbWQtZGVidWdmcy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZC9tZC1kZWJ1Z2Zz
LmgKCi0tIAoyLjIyLjAKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQu
Y29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==
