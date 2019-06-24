Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 50947505B0
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 11:30:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7BFAB87633;
	Mon, 24 Jun 2019 09:30:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 523265B687;
	Mon, 24 Jun 2019 09:30:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5B872206D4;
	Mon, 24 Jun 2019 09:30:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5O9SwaJ004482 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 05:28:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C0DE91001E61; Mon, 24 Jun 2019 09:28:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C390F1001DC0;
	Mon, 24 Jun 2019 09:28:57 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D661480F6D;
	Mon, 24 Jun 2019 09:28:56 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Mon, 24 Jun 2019 03:28:42 -0600
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 24 Jun 2019 11:27:27 +0200
Message-Id: <20190624092756.7769-3-mwilck@suse.com>
In-Reply-To: <20190624092756.7769-1-mwilck@suse.com>
References: <20190624092756.7769-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.27]); Mon, 24 Jun 2019 09:28:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Mon, 24 Jun 2019 09:28:57 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 02/30] libmultipath: fix gcc
	-Wstringop-truncation warning in set_value()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 24 Jun 2019 09:30:25 +0000 (UTC)

Rml4ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nOgoKSW4gZnVuY3Rpb24g4oCYc3RybmNhdOKAmSwK
ICAgIGlubGluZWQgZnJvbSDigJhzZXRfdmFsdWXigJkgYXQgcGFyc2VyLmM6MzgyOjM6Ci91c3Iv
aW5jbHVkZS9iaXRzL3N0cmluZ19mb3J0aWZpZWQuaDoxMzY6MTA6IHdhcm5pbmc6IOKAmF9fYnVp
bHRpbl9zdHJuY2F04oCZCiAgICBvdXRwdXQgdHJ1bmNhdGVkIGJlZm9yZSB0ZXJtaW5hdGluZyBu
dWwgY29weWluZyBhcyBtYW55IGJ5dGVzIGZyb20gYQogICAgc3RyaW5nIGFzIGl0cyBsZW5ndGgg
Wy1Xc3RyaW5nb3AtdHJ1bmNhdGlvbl0KICAxMzYgfCAgIHJldHVybiBfX2J1aWx0aW5fX19zdHJu
Y2F0X2NoayAoX19kZXN0LCBfX3NyYywgX19sZW4sIF9fYm9zIChfX2Rlc3QpKTsKICAgICAgfCAg
ICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fgpwYXJzZXIuYzogSW4gZnVuY3Rpb24g4oCYc2V0X3ZhbHVl4oCZOgpwYXJz
ZXIuYzozODI6Mzogbm90ZTogbGVuZ3RoIGNvbXB1dGVkIGhlcmUKICAzODIgfCAgIHN0cm5jYXQo
YWxsb2MsIHN0ciwgc3RybGVuKHN0cikpOwogICAgICB8ICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn4KCmdjYydzIHN0cmluZ29wIGNoZWNrZXIgZXhwZWN0cyB0aGF0IHRoZSBzaXpl
IGFyZ3VtZW50IG9mIHN0cm5jYXQoKSBpcyBkZXJpdmVkCmZyb20gdGhlIGRlc3RpbmF0aW9uLCBu
b3Qgc291cmNlLCBzaWRlLgpTZWUgaHR0cHM6Ly9kZXZlbG9wZXJzLnJlZGhhdC5jb20vYmxvZy8y
MDE4LzA1LzI0L2RldGVjdGluZy1zdHJpbmctdHJ1bmNhdGlvbi13aXRoLWdjYy04LwoKRml4IHR5
cG8gaW4gZXJyb3IgbWVzc2FnZSBhbG9uZyB0aGUgd2F5LgoKU2lnbmVkLW9mZi1ieTogTWFydGlu
IFdpbGNrIDxtd2lsY2tAc3VzZS5jb20+Ci0tLQogbGlibXVsdGlwYXRoL3BhcnNlci5jIHwgMjAg
KysrKysrKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEx
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYm11bHRpcGF0aC9wYXJzZXIuYyBiL2xpYm11
bHRpcGF0aC9wYXJzZXIuYwppbmRleCA5MmVmN2NmNS4uZTAwYzVmZmYgMTAwNjQ0Ci0tLSBhL2xp
Ym11bHRpcGF0aC9wYXJzZXIuYworKysgYi9saWJtdWx0aXBhdGgvcGFyc2VyLmMKQEAgLTM0NSwx
NyArMzQ1LDEzIEBAIHNldF92YWx1ZSh2ZWN0b3Igc3RydmVjKQogCQlpZiAoYWxsb2MpCiAJCQlt
ZW1jcHkoYWxsb2MsIHN0ciwgc2l6ZSk7CiAJCWVsc2UKLQkJCWNvbmRsb2coMCwgImNhbid0IGFs
bG9jYXRlIG1lbWVvcnkgZm9yIG9wdGlvbiAnJXMnIiwKLQkJCQkoY2hhciAqKVZFQ1RPUl9TTE9U
KHN0cnZlYywgMCkpOworCQkJZ290byBvb207CiAJCXJldHVybiBhbGxvYzsKIAl9CiAJLyogRXZl
biBlbXB0eSBxdW90ZXMgY291bnRzIGFzIGEgdmFsdWUgKEFuIGVtcHR5IHN0cmluZykgKi8KIAlh
bGxvYyA9IChjaGFyICopIE1BTExPQyhzaXplb2YgKGNoYXIpKTsKLQlpZiAoIWFsbG9jKSB7Ci0J
CWNvbmRsb2coMCwgImNhbid0IGFsbG9jYXRlIG1lbWVvcnkgZm9yIG9wdGlvbiAnJXMnIiwKLQkJ
CShjaGFyICopVkVDVE9SX1NMT1Qoc3RydmVjLCAwKSk7Ci0JCXJldHVybiBOVUxMOwotCX0KKwlp
ZiAoIWFsbG9jKQorCQlnb3RvIG9vbTsKIAlmb3IgKGkgPSAyOyBpIDwgVkVDVE9SX1NJWkUoc3Ry
dmVjKTsgaSsrKSB7CiAJCXN0ciA9IFZFQ1RPUl9TTE9UKHN0cnZlYywgaSk7CiAJCWlmICghc3Ry
KSB7CkBAIC0zNzMsMTUgKzM2OSwxNyBAQCBzZXRfdmFsdWUodmVjdG9yIHN0cnZlYykKIAkJYWxs
b2MgPSBSRUFMTE9DKGFsbG9jLCBzaXplb2YgKGNoYXIpICogbGVuKTsKIAkJaWYgKCFhbGxvYykg
ewogCQkJRlJFRSh0bXApOwotCQkJY29uZGxvZygwLCAiY2FuJ3QgYWxsb2NhdGUgbWVtZW9yeSBm
b3Igb3B0aW9uICclcyciLAotCQkJCShjaGFyICopVkVDVE9SX1NMT1Qoc3RydmVjLCAwKSk7Ci0J
CQlyZXR1cm4gTlVMTDsKKwkJCWdvdG8gb29tOwogCQl9CiAJCWlmICgqYWxsb2MgIT0gJ1wwJykK
IAkJCXN0cm5jYXQoYWxsb2MsICIgIiwgMSk7Ci0JCXN0cm5jYXQoYWxsb2MsIHN0ciwgc3RybGVu
KHN0cikpOworCQlzdHJuY2F0KGFsbG9jLCBzdHIsIGxlbiAtIHN0cmxlbihhbGxvYykgLSAxKTsK
IAl9CiAJcmV0dXJuIGFsbG9jOworb29tOgorCWNvbmRsb2coMCwgImNhbid0IGFsbG9jYXRlIG1l
bW9yeSBmb3Igb3B0aW9uICclcyciLAorCQkoY2hhciAqKVZFQ1RPUl9TTE9UKHN0cnZlYywgMCkp
OworCXJldHVybiBOVUxMOwogfQogCiAvKiBub24tcmVjdXJzaXZlIGNvbmZpZ3VyYXRpb24gc3Ry
ZWFtIGhhbmRsZXIgKi8KLS0gCjIuMjEuMAoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRl
dmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2Rt
LWRldmVs
