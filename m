Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D05E8A98A3
	for <lists+dm-devel@lfdr.de>; Thu,  5 Sep 2019 04:59:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5B0B53084050;
	Thu,  5 Sep 2019 02:59:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 809971001958;
	Thu,  5 Sep 2019 02:59:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5F1134A486;
	Thu,  5 Sep 2019 02:59:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x852x157015089 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Sep 2019 22:59:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9704F60127; Thu,  5 Sep 2019 02:59:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx30.extmail.prod.ext.phx2.redhat.com
	[10.5.110.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11168600F8;
	Thu,  5 Sep 2019 02:58:59 +0000 (UTC)
Received: from h3cspam02-ex.h3c.com (smtp.h3c.com [60.191.123.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 226591DA2;
	Thu,  5 Sep 2019 02:58:55 +0000 (UTC)
Received: from DAG2EX09-IDC.srv.huawei-3com.com ([10.8.0.72])
	by h3cspam02-ex.h3c.com with ESMTPS id x852waVu003425
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 Sep 2019 10:58:36 +0800 (GMT-8)
	(envelope-from wu.chongyun@h3c.com)
Received: from DAG2EX01-BASE.srv.huawei-3com.com (10.8.0.64) by
	DAG2EX09-IDC.srv.huawei-3com.com (10.8.0.72) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Thu, 5 Sep 2019 10:58:36 +0800
Received: from DAG2EX01-BASE.srv.huawei-3com.com ([::1]) by
	DAG2EX01-BASE.srv.huawei-3com.com ([fe80::64d2:2654:b7b6:3653%6]) with
	mapi id 15.01.1713.004; Thu, 5 Sep 2019 10:58:36 +0800
From: Chongyun Wu <wu.chongyun@h3c.com>
To: "Martin Wilck (mwilck@suse.com)" <mwilck@suse.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Thread-Topic: [dm-devel] [PATCH] libmultipath:  multipath active paths count
	optimization
Thread-Index: AdVhNnQW1jI2k62vQWmrQDfZZyGCMA==
Date: Thu, 5 Sep 2019 02:58:36 +0000
Message-ID: <413f046d0cfc4d5dbd39ebed92068c8b@h3c.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.125.108.109]
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: h3cspam02-ex.h3c.com x852waVu003425
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Thu, 05 Sep 2019 02:58:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Thu, 05 Sep 2019 02:58:56 +0000 (UTC) for IP:'60.191.123.50'
	DOMAIN:'smtp.h3c.com' HELO:'h3cspam02-ex.h3c.com'
	FROM:'wu.chongyun@h3c.com' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 60.191.123.50 smtp.h3c.com 60.191.123.50
	smtp.h3c.com <wu.chongyun@h3c.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.71
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x852x157015089
X-loop: dm-devel@redhat.com
Cc: Liucong <liu.cong@h3c.com>, Zhangcheng <zhang.chengA@h3c.com>,
	Guozhonghua <guozhonghua@h3c.com>, Zhangduan <zhang.duan@h3c.com>,
	Zhangguanghui <zhang.guanghui@h3c.com>,
	Changlimin <changlimin@h3c.com>, Renqinwei <ren.qinwei@h3c.com>,
	Wangxibo <wang.xibo@h3c.com>, Likai <li.kai4@h3c.com>,
	Liliang <li.liangA@h3c.com>, Wangyong <wang.yongD@h3c.com>,
	Huangyong <huang.yongA@h3c.com>
Subject: [dm-devel] [PATCH] libmultipath: multipath active paths count
 optimization
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Thu, 05 Sep 2019 02:59:27 +0000 (UTC)

SGkgTWFydGluLCBCZW4gYW5kIG90aGVyIHZpZXdlcnMKCkNsb3VkIHlvdSBoZWxwIHRvIHZpZXcg
YmVsb3cgcGF0Y2ggd2hpY2ggdHJ5IHRvIGRlYWwgd2l0aCBhIG11bHRpcGF0aCBhY3RpdmUgcGF0
aHMKY291bnQgbm90IHJpZ2h0IGlzc3VlLCB0aGFua3MgYSBsb3QuCgo+RnJvbSBkZWVlNzE5NmVj
ZTQzYjAxYjhlZTYzNWU2MGNlNDY1MDgwOTA1YjVlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpG
cm9tOiBDaG9uZ3l1biBXdSA8d3UuY2hvbmd5dW5AaDNjLmNvbT4KRGF0ZTogVHVlLCAyNyBBdWcg
MjAxOSAxMzo1ODozMyArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIGxpYm11bHRpcGF0aDogIG11bHRp
cGF0aCBhY3RpdmUgcGF0aHMgY291bnQgb3B0aW1pemF0aW9uCgpSZWFsbHkgY291bnQgbXVsdGlw
YXRoIGFjdGl2ZSBwYXRocyBub3QgdXNlIG1wcC0+bnJfYWN0aXZlKysKb3IgbXBwLT5ucl9hY3Rp
dmUtLSwgYmVjYXVzZSB0aGVyZSBhcmUgb3RoZXIgcGxhY2VzIG1pZ2h0IGNhbGwKcGF0aGluZm8g
dG8gY2hhbmdlIHBhdGggc3RhdGUgbm90IG9ubHkgaW4gY2hlY2tfcGF0aCwgaWYgb3RoZXIKcGxh
Y2VzIGRldGVjdCBhbmQgY2hhbmdlZCBwYXRoIHN0YXRlIGJ1dCBub3QgZG8gbXBwLT5ucl9hY3Rp
dmUrKwpvciBtcHAtPm5yX2FjdGl2ZS0tLCB0aGUgYWN0aXZlIHBhdGhzIG1pZ2h0IG5vdCByaWdo
dCBhbnkgbW9yZS4KCldlIG1lZXQgYW4gaXNzdWUgd2hpY2ggYWN0dWFsbHkgaGF2ZSB0aHJlZSBw
YXRocyBidXQgYWZ0ZXIgYWxsCnBhdGhzIGRvd24gc3lzbG9nIHJlcG9ydCBoYXZlIHRocmVlIHBh
dGhzIHJlbWFpbmluZyBzbyBtdWx0aXBhdGhkCm5vdCBzZW5kIGRpc2FibGUgcXVldWVpbmcgdG8g
ZG0gYW5kIHRoaXMgZG0gZGV2aWNlIGJlZW4gYmxvY2tlZC4KVGhpcyBwYXRjaCBtaWdodCBmaXgg
dGhpcyBpc3N1ZS4KClNpZ25lZC1vZmYtYnk6IENob25neXVuIFd1IDx3dS5jaG9uZ3l1bkBoM2Mu
Y29tPgotLS0KIGxpYm11bHRpcGF0aC9zdHJ1Y3RzX3ZlYy5jIHwgOCArKysrKystLQogMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9s
aWJtdWx0aXBhdGgvc3RydWN0c192ZWMuYyBiL2xpYm11bHRpcGF0aC9zdHJ1Y3RzX3ZlYy5jCmlu
ZGV4IGM0M2I1OGYuLjdlMjQ0MWIgMTAwNjQ0Ci0tLSBhL2xpYm11bHRpcGF0aC9zdHJ1Y3RzX3Zl
Yy5jCisrKyBiL2xpYm11bHRpcGF0aC9zdHJ1Y3RzX3ZlYy5jCkBAIC00NTAsNyArNDUwLDggQEAg
aW50IHZlcmlmeV9wYXRocyhzdHJ1Y3QgbXVsdGlwYXRoICptcHAsIHN0cnVjdCB2ZWN0b3JzICp2
ZWNzKQogICovCiB2b2lkIHVwZGF0ZV9xdWV1ZV9tb2RlX2RlbF9wYXRoKHN0cnVjdCBtdWx0aXBh
dGggKm1wcCkKIHsKLQlpZiAoLS1tcHAtPm5yX2FjdGl2ZSA9PSAwKSB7CisJbXBwLT5ucl9hY3Rp
dmUgPSBwYXRoY291bnQobXBwLCBQQVRIX1VQKSArIHBhdGhjb3VudChtcHAsIFBBVEhfR0hPU1Qp
OworCWlmIChtcHAtPm5yX2FjdGl2ZSA9PSAwKSB7CiAJCWlmIChtcHAtPm5vX3BhdGhfcmV0cnkg
PiAwKQogCQkJZW50ZXJfcmVjb3ZlcnlfbW9kZShtcHApOwogCQllbHNlIGlmIChtcHAtPm5vX3Bh
dGhfcmV0cnkgIT0gTk9fUEFUSF9SRVRSWV9RVUVVRSkKQEAgLTQ2MSw3ICs0NjIsMTAgQEAgdm9p
ZCB1cGRhdGVfcXVldWVfbW9kZV9kZWxfcGF0aChzdHJ1Y3QgbXVsdGlwYXRoICptcHApCiAKIHZv
aWQgdXBkYXRlX3F1ZXVlX21vZGVfYWRkX3BhdGgoc3RydWN0IG11bHRpcGF0aCAqbXBwKQogewot
CWlmIChtcHAtPm5yX2FjdGl2ZSsrID09IDAgJiYgbXBwLT5ub19wYXRoX3JldHJ5ID4gMCkgewor
CWludCBvbGRfYWN0aXZlX3BhdGhzID0gbXBwLT5ucl9hY3RpdmU7CisJbXBwLT5ucl9hY3RpdmUg
PSBwYXRoY291bnQobXBwLCBQQVRIX1VQKSArIHBhdGhjb3VudChtcHAsIFBBVEhfR0hPU1QpOwor
CWlmICgob2xkX2FjdGl2ZV9wYXRocyA9PSAwICYmIG1wcC0+bnJfYWN0aXZlID09IDEpCisJCSYm
IG1wcC0+bm9fcGF0aF9yZXRyeSA+IDApIHsKIAkJLyogY29tZSBiYWNrIHRvIG5vcm1hbCBtb2Rl
IGZyb20gcmV0cnkgbW9kZSAqLwogCQltcHAtPnJldHJ5X3RpY2sgPSAwOwogCQlkbV9xdWV1ZV9p
Zl9ub19wYXRoKG1wcC0+YWxpYXMsIDEpOwotLSAKCkJlc3QgUmVnYXJkc6OsCkNob25neXVuIFd1
CgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93
d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs
