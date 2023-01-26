Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEF167C598
	for <lists+dm-devel@lfdr.de>; Thu, 26 Jan 2023 09:16:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674720962;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vEEZAMJGpeYQcwWutAMZ6FxjZxY+icpXMVS+GNiITMw=;
	b=F6A/RuuwgiCB/kLrKZwuDVL6cvqFTW5GhyeoVA5J+VknWE6sotCxlvjB9UQHYUlNOQoOsJ
	VpE4qdxsgvOHpAVTh3RtxJ/dl27CfrPbW3qy/L9bYaSy6wDGsixJctA2t1KOFbVIYZ9kMc
	U9tbxyjZQRTbB6WoeoJVlkAcH9r//wc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-3-GZzRtKMHmJCF1-Fg2Yqg-1; Thu, 26 Jan 2023 03:15:53 -0500
X-MC-Unique: 3-GZzRtKMHmJCF1-Fg2Yqg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FAEA185A794;
	Thu, 26 Jan 2023 08:15:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E0E63492B01;
	Thu, 26 Jan 2023 08:15:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 25E9419465A8;
	Thu, 26 Jan 2023 08:15:39 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4FB27194658C
 for <dm-devel@listman.corp.redhat.com>; Thu, 26 Jan 2023 03:40:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EF007C15BAD; Thu, 26 Jan 2023 03:40:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7667C15BA0
 for <dm-devel@redhat.com>; Thu, 26 Jan 2023 03:40:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C85783806101
 for <dm-devel@redhat.com>; Thu, 26 Jan 2023 03:40:58 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-661-TdyVpsuYNAC1V_Maz19QjA-1; Wed, 25 Jan 2023 22:40:57 -0500
X-MC-Unique: TdyVpsuYNAC1V_Maz19QjA-1
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id D81D35C05B2;
 Wed, 25 Jan 2023 22:34:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 25 Jan 2023 22:34:05 -0500
X-ME-Sender: <xms:rfTRY6725xmw3M9_wy6VAcPGHbcrIDAAXALC_ezzqGgu8_uRhoPv0w>
 <xme:rfTRYz54wgPmc9J-m65mihdjNty8KrpH3dOxqxrzqbIl5I_4wleBtSzykLUzL999H
 yEK2Y9VkVevVew>
X-ME-Received: <xmr:rfTRY5c-XeYocmJVDOF_vnw6pNbx_lwfvTcuwuxZ1xAZTtge5V4IEydC9RVAweE53XptqUbyW9xj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvfedgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeffvghmihcu
 ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
 hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhgefgieeitdeijeeguddtkefgteeg
 heehgeetkeevhfefgfduhedtveelgeeugeenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
 rggsrdgtohhm
X-ME-Proxy: <xmx:rfTRY3K8BsaR6SikC5jT7-f3d9e22OHeqXhkgePMrLn0y58UnAVNCw>
 <xmx:rfTRY-JsiC-CmyH3JqmtndM5ovAjIocOp_H5Vnz5xbocvmIcvUB5Vw>
 <xmx:rfTRY4wEKKzvSMjPN6rg_jb98hKZEXW7biJaskmWaZ9ourLFDq6IKQ>
 <xmx:rfTRY9_6RGw9FBSqSFdBrKQEovNBIAL-_eHatj1IbfsXY2Q7MP1mdQ>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jan 2023 22:34:04 -0500 (EST)
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jens Axboe <axboe@kernel.dk>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>
Date: Wed, 25 Jan 2023 22:33:52 -0500
Message-Id: <20230126033358.1880-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Thu, 26 Jan 2023 08:15:37 +0000
Subject: [dm-devel] [RFC PATCH 0/7] Allow race-free block device handling
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhpcyB3b3JrIGFpbXMgdG8gYWxsb3cgdXNlcnNwYWNlIHRvIGNyZWF0ZSBhbmQgZGVzdHJveSBi
bG9jayBkZXZpY2VzCmluIGEgcmFjZS1mcmVlIGFuZCBsZWFrLWZyZWUgd2F5LCBhbmQgdG8gYWxs
b3cgdGhlbSB0byBiZSBleHBvc2VkIHRvCm90aGVyIFhlbiBWTXMgdmlhIGJsa2JhY2sgd2l0aG91
dCBsZWFrcyBvciByYWNlcy4gIEl04oCZcyBtYXJrZWQgYXMgUkZDCmZvciBhIGZldyByZWFzb25z
OgoKLSBUaGUgY29kZSBoYXMgYmVlbiBvbmx5IGxpZ2h0bHkgdGVzdGVkLiAgSXQgbWlnaHQgYmUg
dW5zdGFibGUgb3IKICBpbnNlY3VyZS4KCi0gVGhlIERNX0RFVl9DUkVBVEUgaW9jdGwgZ2FpbnMg
YSBuZXcgZmxhZy4gIFVua25vd24gZmxhZ3Mgd2VyZQogIHByZXZpb3VzbHkgaWdub3JlZCwgc28g
dGhpcyBjb3VsZCB0aGVvcmV0aWNhbGx5IGJyZWFrIGJ1Z2d5IHVzZXJzcGFjZQogIHRvb2xzLgoK
LSBJIGhhdmUgbm8gaWRlYSBpZiBJIGdvdCB0aGUgYmxvY2sgZGV2aWNlIHJlZmVyZW5jZSBjb3Vu
dGluZyBhbmQKICBsb2NraW5nIGNvcnJlY3QuCgpEZW1pIE1hcmllIE9iZW5vdXIgKDcpOgogIGJs
b2NrOiBTdXBwb3J0IGNyZWF0aW5nIGEgc3RydWN0IGZpbGUgZnJvbSBhIGJsb2NrIGRldmljZQog
IEFsbG93IHVzZXJzcGFjZSB0byBnZXQgYW4gRkQgdG8gYSBuZXdseS1jcmVhdGVkIERNIGRldmlj
ZQogIEltcGxlbWVudCBkaXNrc2VxIGNoZWNrcyBpbiBibGtiYWNrCiAgSW5jcmVtZW50IGRpc2tz
ZXEgd2hlbiByZWxlYXNpbmcgYSBsb29wIGRldmljZQogIElmIGF1dG9jbGVhciBpcyBzZXQsIGRl
bGV0ZSBhIG5vLWxvbmdlci11c2VkIGxvb3AgZGV2aWNlCiAgTWlub3IgYmxrYmFjayBjbGVhbnVw
cwogIHhlbi9ibGtiYWNrOiBJbmZvcm0gdXNlcnNwYWNlIHRoYXQgZGV2aWNlIGhhcyBiZWVuIG9w
ZW5lZAoKIGJsb2NrL2JkZXYuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDc3ICsrKysrKysr
KysrLS0KIGJsb2NrL2dlbmhkLmMgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZl
cnMvYmxvY2svbG9vcC5jICAgICAgICAgICAgICAgIHwgIDE3ICsrLQogZHJpdmVycy9ibG9jay94
ZW4tYmxrYmFjay9ibGtiYWNrLmMgfCAgIDggKy0KIGRyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sv
eGVuYnVzLmMgIHwgMTcxICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0KIGRyaXZlcnMvbWQv
ZG0taW9jdGwuYyAgICAgICAgICAgICAgIHwgIDY3ICsrKysrKysrKy0tCiBpbmNsdWRlL2xpbnV4
L2Jsa2Rldi5oICAgICAgICAgICAgICB8ICAgNSArCiBpbmNsdWRlL3VhcGkvbGludXgvZG0taW9j
dGwuaCAgICAgICB8ICAxNiArKy0KIDggZmlsZXMgY2hhbmdlZCwgMjk4IGluc2VydGlvbnMoKyks
IDY0IGRlbGV0aW9ucygtKQoKLS0gClNpbmNlcmVseSwKRGVtaSBNYXJpZSBPYmVub3VyIChzaGUv
aGVyL2hlcnMpCkludmlzaWJsZSBUaGluZ3MgTGFiCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2RtLWRldmVsCg==

