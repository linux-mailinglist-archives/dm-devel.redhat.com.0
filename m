Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7C209260E06
	for <lists+dm-devel@lfdr.de>; Tue,  8 Sep 2020 10:51:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-IHe1-T6xMHqxinJtXLivmw-1; Tue, 08 Sep 2020 04:50:18 -0400
X-MC-Unique: IHe1-T6xMHqxinJtXLivmw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2C3718B9F41;
	Tue,  8 Sep 2020 08:50:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0C931A887;
	Tue,  8 Sep 2020 08:50:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 416FF7A001;
	Tue,  8 Sep 2020 08:50:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0888o8ih016474 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Sep 2020 04:50:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B8DAB2014E1B; Tue,  8 Sep 2020 08:50:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4800200A799
	for <dm-devel@redhat.com>; Tue,  8 Sep 2020 08:50:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5025080121C
	for <dm-devel@redhat.com>; Tue,  8 Sep 2020 08:50:06 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-507-UBdpdGCeNsqUb5wp_l6g8g-1; Tue, 08 Sep 2020 04:50:04 -0400
X-MC-Unique: UBdpdGCeNsqUb5wp_l6g8g-1
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 12F784E07C6BF81862B8;
	Tue,  8 Sep 2020 16:49:58 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.232) by DGGEMS413-HUB.china.huawei.com
	(10.3.19.213) with Microsoft SMTP Server id 14.3.487.0;
	Tue, 8 Sep 2020 16:49:51 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Martin Wilck
	<mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, "dm-devel
	mailing list" <dm-devel@redhat.com>
References: <2fb59aa1-eafa-49b6-08aa-a279565ec234@huawei.com>
Message-ID: <686d0ca6-2bbf-095d-63bc-346ca609061a@huawei.com>
Date: Tue, 8 Sep 2020 16:49:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2fb59aa1-eafa-49b6-08aa-a279565ec234@huawei.com>
X-Originating-IP: [10.174.179.232]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH V3 06/14] kpartx: check return value of
 malloc in main func
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

In main func of kpartx.c, we should check return value of
malloc before using it.

V1->V2: change malloc to xmalloc

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
---
 kpartx/kpartx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kpartx/kpartx.c b/kpartx/kpartx.c
index 98f6176e..6de3c9c4 100644
--- a/kpartx/kpartx.c
+++ b/kpartx/kpartx.c
@@ -61,6 +61,9 @@ struct pt {
 int ptct = 0;
 int udev_sync = 1;

+extern void *
+xmalloc (size_t size);
+
 static void
 addpts(char *t, ptreader f)
 {
@@ -383,7 +386,7 @@ main(int argc, char **argv){
 		mapname = device + off;

 	if (delim == NULL) {
-		delim = malloc(DELIM_SIZE);
+		delim = xmalloc(DELIM_SIZE);
 		memset(delim, 0, DELIM_SIZE);
 		set_delimiter(mapname, delim);
 	}
-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

