Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7E26C1E745F
	for <lists+dm-devel@lfdr.de>; Fri, 29 May 2020 06:13:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590725605;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZuZaggIMC6HfAQWhvkyvURCsTakmrDuzO2db3I9Kkdo=;
	b=YZMDuc/uXfXSuW32d8Nrj15x/c8ZKgvvDi/slLSOymKpBRBRBxkcv6CWi62azDiCMrtPW+
	9h8gNk5jJdrG1sD/jajTeI0hN3Tgrzfq6jYx1StId3tOCgvGqB/g6XUSkibSokHEu166hY
	tgUxhl2JPAGJJnHYukB+/2C5ZMD/C2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-vzAOlLdCO7OiICQIcnnjuw-1; Fri, 29 May 2020 00:13:23 -0400
X-MC-Unique: vzAOlLdCO7OiICQIcnnjuw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C31E51855A10;
	Fri, 29 May 2020 04:13:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3070B1A835;
	Fri, 29 May 2020 04:13:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 007126B5BE;
	Fri, 29 May 2020 04:13:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04T4AncV005265 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 00:10:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3BBED10016EB; Fri, 29 May 2020 04:10:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79E6C10013D0;
	Fri, 29 May 2020 04:10:46 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 04T4AifT003559; 
	Thu, 28 May 2020 23:10:44 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 04T4Ai4R003558;
	Thu, 28 May 2020 23:10:44 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 28 May 2020 23:10:42 -0500
Message-Id: <1590725443-3519-1-git-send-email-bmarzins@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 0/1] multipath: libdmmp json fix
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhpcyBpcyBhIHBhdGNoIEkgZ290IHRvIGtlZXAgbGliZG1tcCB3b3JraW5nIHdpdGggdGhlIGxh
dGVzdCBqc29uLWMKcmVsZWFzZS4KCkJqw7ZybiBFc3NlciAoMSk6CiAgbGliZG1tcDogQWRkIHN1
cHBvcnQgZm9yIHVwY29taW5nIGpzb24tYyAwLjE0LjAuCgogbGliZG1tcC9saWJkbW1wX3ByaXZh
dGUuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKLS0gCjIuMTcuMgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5j
b20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

