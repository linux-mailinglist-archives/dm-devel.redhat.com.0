Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 53C8525FB48
	for <lists+dm-devel@lfdr.de>; Mon,  7 Sep 2020 15:27:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-Ax-KdDXrPBi0Cmnoti-U1A-1; Mon, 07 Sep 2020 09:27:00 -0400
X-MC-Unique: Ax-KdDXrPBi0Cmnoti-U1A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63B851DDEF;
	Mon,  7 Sep 2020 13:26:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07EDC5D9D2;
	Mon,  7 Sep 2020 13:26:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0932018561B2;
	Mon,  7 Sep 2020 13:26:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 087DQZpr021894 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 7 Sep 2020 09:26:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F2DE72156A2D; Mon,  7 Sep 2020 13:26:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE5602166B44
	for <dm-devel@redhat.com>; Mon,  7 Sep 2020 13:26:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92A64827EF1
	for <dm-devel@redhat.com>; Mon,  7 Sep 2020 13:26:32 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-568-UncuMhJfNCKEkXlnzy1UTA-1; Mon, 07 Sep 2020 09:26:30 -0400
X-MC-Unique: UncuMhJfNCKEkXlnzy1UTA-1
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 6E66A9D0598ABF7D3E41;
	Mon,  7 Sep 2020 21:26:26 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS404-HUB.china.huawei.com
	(10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Mon, 7 Sep 2020
	21:26:15 +0800
To: Benjamin Marzinski <bmarzins@redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<5beca982-98a1-e48b-f86f-95810bc3c49c@huawei.com>
	<20200905000501.GH11108@octiron.msp.redhat.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <2ded7cb8-9c6c-d4a7-84c8-87b4b164d658@huawei.com>
Date: Mon, 7 Sep 2020 21:26:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905000501.GH11108@octiron.msp.redhat.com>
X-Originating-IP: [10.174.179.62]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 087DQZpr021894
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 12/14] libmultipathpersist: use
 update_multipath_table/status, in get_mpvec
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Language: en-GB

Cj4gTG9va3MgbW9zdGx5IGdvb2QuIEkgYWdyZWUgdGhhdCB3ZSBzaG91bGQgYmUgY2hlY2tpbmcg
dGhlIHJlc3VsdHMgb2YKPiBnZXR0aW5nIHRoZSByYXcgZGF0YSBiZWZvcmUgd2UgdHJ5IHRvIGRp
c2Fzc2VtYmxlIGl0LiBCdXQsIHRoZXJlJ3Mgbm90Cj4gcmVhbGx5IGFueSBwb2ludCB0byBjYWxs
aW5nIGNvbnRpbnVlIGFzIHRoZSBsYXN0IG9wZXJhdGlvbiBvZiBhIGxvb3AuCj4gUGVyaGFwcwo+
IAo+IGlmICh1cGRhdGVfbXVsdGlwYXRoX3RhYmxlKG1wcCwgcGF0aHZlYywgRElfQ0hFQ0tFUikg
PT0gRE1QX09LKQo+IAl1cGRhdGVfbXVsdGlwYXRoX3N0YXR1cyhtcHApOwo+IAo+IG1ha2VzIG1v
cmUgc2Vuc2UuCj4gCkhpIEJlbu+8jAogIFRoYW5rcyBmb3IgeW91ciByZXZpZXcuIEkgd2lsbCBj
aGFuZ2UgaXQgaW4gcGF0Y2ggdjIuCgotTGl4aWFva2VuZwoKCi0tCmRtLWRldmVsIG1haWxpbmcg
bGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9s
aXN0aW5mby9kbS1kZXZlbA==

