Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B1A61219D9D
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:21:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-J_Vxasr_NzqmE-HohvWtbg-1; Thu, 09 Jul 2020 06:21:48 -0400
X-MC-Unique: J_Vxasr_NzqmE-HohvWtbg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05F3719253C5;
	Thu,  9 Jul 2020 10:21:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D193F60F8D;
	Thu,  9 Jul 2020 10:21:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 84BD31809561;
	Thu,  9 Jul 2020 10:21:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AH2H7029505 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:17:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 67BDE5EDFD; Thu,  9 Jul 2020 10:17:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63A695EDEB
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 435C780CD81
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:02 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-97-Pyz-HxO0OkexcmvJF3TxoA-1;
	Thu, 09 Jul 2020 06:16:57 -0400
X-MC-Unique: Pyz-HxO0OkexcmvJF3TxoA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 719DDB05C;
	Thu,  9 Jul 2020 10:16:54 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:16:01 +0200
Message-Id: <20200709101620.6786-17-mwilck@suse.com>
In-Reply-To: <20200709101620.6786-1-mwilck@suse.com>
References: <20200709101620.6786-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AH2H7029505
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 16/35] libmultipath: fix gcc -Wstringop-overflow
	warning
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RnJvbTogTWFydGluIFdpbGNrIDxtd2lsY2tAc3VzZS5jb20+CgpUaGlzIGZpeGVzIHRoaXMgZ2Nj
IGVycm9yIG1lc3NhZ2U6CgplcnJvcjog4oCYc3RybmNhdOKAmSBzcGVjaWZpZWQgYm91bmQgMSBl
cXVhbHMgc291cmNlIGxlbmd0aAogICBbLVdlcnJvcj1zdHJpbmdvcC1vdmVyZmxvdz1dClNpZ25l
ZC1vZmYtYnk6IE1hcnRpbiBXaWxjayA8bXdpbGNrQHN1c2UuY29tPgotLS0KIGxpYm11bHRpcGF0
aC9wYXJzZXIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYm11bHRpcGF0aC9wYXJzZXIuYyBiL2xpYm11bHRpcGF0
aC9wYXJzZXIuYwppbmRleCAxMWE2MTY4Li40ZjY1YmExIDEwMDY0NAotLS0gYS9saWJtdWx0aXBh
dGgvcGFyc2VyLmMKKysrIGIvbGlibXVsdGlwYXRoL3BhcnNlci5jCkBAIC0zNzQsNyArMzc0LDcg
QEAgc2V0X3ZhbHVlKHZlY3RvciBzdHJ2ZWMpCiAJCQlnb3RvIG9vbTsKIAkJfQogCQlpZiAoKmFs
bG9jICE9ICdcMCcpCi0JCQlzdHJuY2F0KGFsbG9jLCAiICIsIDEpOworCQkJc3RybmNhdChhbGxv
YywgIiAiLCBsZW4gLSBzdHJsZW4oYWxsb2MpKTsKIAkJc3RybmNhdChhbGxvYywgc3RyLCBsZW4g
LSBzdHJsZW4oYWxsb2MpIC0gMSk7CiAJfQogCXJldHVybiBhbGxvYzsKLS0gCjIuMjYuMgoKCi0t
CmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJl
ZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

