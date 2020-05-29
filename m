Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id EBED51E745D
	for <lists+dm-devel@lfdr.de>; Fri, 29 May 2020 06:12:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590725520;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Se1y5Wai5VuiGwDeC75MJfw1J4GEyJtfjE2dmUpE7l0=;
	b=NnOKEuDsAUD4nVA0HO8frFRfBUqk714wE/ZFzWalLnG9JGCkssrpJVg41eoa5epMSv2A62
	7M82kMzHjuXRo3KK84v4FIWSH7EXqb9upEVF0QGEvl1CMloHnI/foL1y8UqO80MF+4jEVR
	WisNkKmtgHhjD+XJOVKS68a2fZqpyPM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-M_KY5t68Pzu37vvPd83_KQ-1; Fri, 29 May 2020 00:11:58 -0400
X-MC-Unique: M_KY5t68Pzu37vvPd83_KQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4EB68014D4;
	Fri, 29 May 2020 04:11:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CA8B2BFF9;
	Fri, 29 May 2020 04:11:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 04FED1809541;
	Fri, 29 May 2020 04:11:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04T4AoUP005270 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 00:10:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C9849579A5; Fri, 29 May 2020 04:10:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4733A1035;
	Fri, 29 May 2020 04:10:47 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 04T4AkUb003563; 
	Thu, 28 May 2020 23:10:46 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 04T4AjBG003562;
	Thu, 28 May 2020 23:10:45 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 28 May 2020 23:10:43 -0500
Message-Id: <1590725443-3519-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1590725443-3519-1-git-send-email-bmarzins@redhat.com>
References: <1590725443-3519-1-git-send-email-bmarzins@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Esser?= <besser82@fedoraproject.org>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 1/1] libdmmp: Add support for upcoming json-c
	0.14.0.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RnJvbTogQmrDtnJuIEVzc2VyIDxiZXNzZXI4MkBmZWRvcmFwcm9qZWN0Lm9yZz4KClRSVUUvRkFM
U0UgYXJlIG5vdCBkZWZpbmVkIGFueW1vcmUuICAxIGFuZCAwIGFyZSB1c2VkIGluc3RlYWQuClRo
aXMgaXMgYmFja3dhcmRzIGNvbXBhdGlibGUsIGFzIGVhcmxpZXIgdmVyc2lvbnMgb2YganNvbi1j
IGFyZQp1c2luZyB0aGUgc2FtZSBpbnRlZ2VyIHZhbHVlcyBpbiB0aGVpciBwcmVzZW50IGRlZmlu
aXRpb25zLgoKU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gTWFyemluc2tpIDxibWFyemluc0ByZWRo
YXQuY29tPgotLS0KIGxpYmRtbXAvbGliZG1tcF9wcml2YXRlLmggfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saWJkbW1w
L2xpYmRtbXBfcHJpdmF0ZS5oIGIvbGliZG1tcC9saWJkbW1wX3ByaXZhdGUuaAppbmRleCBhYzg1
YjYzZi4uNDM3ODk2MmIgMTAwNjQ0Ci0tLSBhL2xpYmRtbXAvbGliZG1tcF9wcml2YXRlLmgKKysr
IGIvbGliZG1tcC9saWJkbW1wX3ByaXZhdGUuaApAQCAtODIsNyArODIsNyBAQCBzdGF0aWMgb3V0
X3R5cGUgZnVuY19uYW1lKHN0cnVjdCBkbW1wX2NvbnRleHQgKmN0eCwgY29uc3QgY2hhciAqdmFy
X25hbWUpIHsgXAogZG8geyBcCiAJanNvbl90eXBlIGpfdHlwZSA9IGpzb25fdHlwZV9udWxsOyBc
CiAJanNvbl9vYmplY3QgKmpfb2JqX3RtcCA9IE5VTEw7IFwKLQlpZiAoanNvbl9vYmplY3Rfb2Jq
ZWN0X2dldF9leChqX29iaiwga2V5LCAmal9vYmpfdG1wKSAhPSBUUlVFKSB7IFwKKwlpZiAoanNv
bl9vYmplY3Rfb2JqZWN0X2dldF9leChqX29iaiwga2V5LCAmal9vYmpfdG1wKSAhPSAxKSB7IFwK
IAkJX2Vycm9yKGN0eCwgIkludmFsaWQgSlNPTiBvdXRwdXQgZnJvbSBtdWx0aXBhdGhkIElQQzog
IiBcCiAJCSAgICAgICAia2V5ICclcycgbm90IGZvdW5kIiwga2V5KTsgXAogCQlyYyA9IERNTVBf
RVJSX0lQQ19FUlJPUjsgXAotLSAKMi4xNy4yCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0t
ZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8v
ZG0tZGV2ZWw=

