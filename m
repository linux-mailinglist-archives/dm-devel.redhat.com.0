Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 7F82D193745
	for <lists+dm-devel@lfdr.de>; Thu, 26 Mar 2020 05:23:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585196606;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Eig8ohWrwuciUrHbH0Oc16iqJVfq9+yfUHBETJtxKPY=;
	b=FvKzwPXMa+xjVyuGgU6igYlkeW0C1nCfcqsV4ySJr1wILqKNl1kQ05swCIp2y2IB/xcPxG
	K7v/3l4PzLmh+jRQdo7WYmf05HR1l4ODxUmsMfOdtW9z0OINuRij1uGUnGyrx4jcaLsI7H
	zcWogCUJwJgAHkw+nsCWW4fBTxfH20s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-6rVizqoBMsqlBzWTXicfFw-1; Thu, 26 Mar 2020 00:23:22 -0400
X-MC-Unique: 6rVizqoBMsqlBzWTXicfFw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65697107ACCA;
	Thu, 26 Mar 2020 04:23:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82C2160BF3;
	Thu, 26 Mar 2020 04:23:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 60CB7863BD;
	Thu, 26 Mar 2020 04:23:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02Q4Mr8Y003791 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 26 Mar 2020 00:22:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BB06D5C1D4; Thu, 26 Mar 2020 04:22:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DB845C1B0;
	Thu, 26 Mar 2020 04:22:50 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 02Q4MnNI023752; 
	Wed, 25 Mar 2020 23:22:49 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 02Q4MmnS023751;
	Wed, 25 Mar 2020 23:22:48 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 25 Mar 2020 23:22:46 -0500
Message-Id: <1585196568-23714-1-git-send-email-bmarzins@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 1/3] libmultipath: assign variable to make gcc
	happy
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlcmUgaXMgbm90aGluZyB3cm9uZyB3aXRoIGlzX3F1ZXVlaW5nIG5vdCBiZWluZyBzZXQgYXQg
dGhlIHN0YXJ0Cm9mIF9fc2V0X25vX3BhdGhfcmV0cnkoKSwgaXQgd2lsbCBhbHdheXMgZ2V0IHNl
dCBiZWZvcmUgaXQgaXMgYWNjZXNzZWQsCmJ1dCBnY2MgOC4yLjEgaXMgZmFpbGluZyB3aXRoCgpz
dHJ1Y3RzX3ZlYy5jOiBJbiBmdW5jdGlvbiDigJhfX3NldF9ub19wYXRoX3JldHJ54oCZOgpzdHJ1
Y3RzX3ZlYy5jOjMzOTo3OiBlcnJvcjog4oCYaXNfcXVldWVpbmfigJkgbWF5IGJlIHVzZWQgdW5p
bml0aWFsaXplZCBpbgp0aGlzIGZ1bmN0aW9uIFstV2Vycm9yPW1heWJlLXVuaW5pdGlhbGl6ZWRd
CiAgYm9vbCBpc19xdWV1ZWluZzsKICAgICAgIF5+fn5+fn5+fn5+CgpzbywgYXNzaWduIGEgdmFs
dWUgdG8gbWFrZSBpdCBoYXBweS4KClJldmlld2VkLWJ5OiBNYXJ0aW4gV2lsY2sgPG13aWxja0Bz
dXNlLmNvbT4KU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gTWFyemluc2tpIDxibWFyemluc0ByZWRo
YXQuY29tPgotLS0KIGxpYm11bHRpcGF0aC9zdHJ1Y3RzX3ZlYy5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGlibXVs
dGlwYXRoL3N0cnVjdHNfdmVjLmMgYi9saWJtdWx0aXBhdGgvc3RydWN0c192ZWMuYwppbmRleCAz
ZGJiYWEwZi4uMDc3ZjJlNDIgMTAwNjQ0Ci0tLSBhL2xpYm11bHRpcGF0aC9zdHJ1Y3RzX3ZlYy5j
CisrKyBiL2xpYm11bHRpcGF0aC9zdHJ1Y3RzX3ZlYy5jCkBAIC0zMzYsNyArMzM2LDcgQEAgc3Rh
dGljIHZvaWQgbGVhdmVfcmVjb3ZlcnlfbW9kZShzdHJ1Y3QgbXVsdGlwYXRoICptcHApCiAKIHZv
aWQgX19zZXRfbm9fcGF0aF9yZXRyeShzdHJ1Y3QgbXVsdGlwYXRoICptcHAsIGJvb2wgY2hlY2tf
ZmVhdHVyZXMpCiB7Ci0JYm9vbCBpc19xdWV1ZWluZzsKKwlib29sIGlzX3F1ZXVlaW5nID0gZmFs
c2U7IC8qIGFzc2lnbiBhIHZhbHVlIHRvIG1ha2UgZ2NjIGhhcHB5ICovCiAKIAljaGVja19mZWF0
dXJlcyA9IGNoZWNrX2ZlYXR1cmVzICYmIG1wcC0+ZmVhdHVyZXMgIT0gTlVMTDsKIAlpZiAoY2hl
Y2tfZmVhdHVyZXMpCi0tIAoyLjE3LjIKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZl
bEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1k
ZXZlbA==

