Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 106937981E5
	for <lists+dm-devel@lfdr.de>; Fri,  8 Sep 2023 08:08:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694153336;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pqM50KwCQdC+KuepTD+hT/U7lqwpeeAfBnWWLzCdevk=;
	b=dZluJ/YV4rJ6/MjteANEs9oYlKp9JJ0+64lYpGB1+dOe3B/+LVP+HL6d40fBtWTg22Qxlr
	CLfw4kPpH2aaYu8gEs/VTd8r7ECscMC74dz8oIEfuenVdP7x8jRUWO8XyZhuCVgqdyk9Jh
	EJS3OKM95b++evG7E6e3Qe7sKD24MKM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-WvOWHR3YNK2lJvkHfqhglw-1; Fri, 08 Sep 2023 02:08:53 -0400
X-MC-Unique: WvOWHR3YNK2lJvkHfqhglw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1EB4101CA8A;
	Fri,  8 Sep 2023 06:08:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 800581121319;
	Fri,  8 Sep 2023 06:08:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E842D19465B3;
	Fri,  8 Sep 2023 06:08:49 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 89B93194658C
 for <dm-devel@listman.corp.redhat.com>; Fri,  8 Sep 2023 06:08:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 66E391121318; Fri,  8 Sep 2023 06:08:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E7161121314
 for <dm-devel@redhat.com>; Fri,  8 Sep 2023 06:08:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1214E181792C
 for <dm-devel@redhat.com>; Fri,  8 Sep 2023 06:08:48 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-186-Mmz6YHM_OiuVe7OHA1Sfnw-1; Fri,
 08 Sep 2023 02:08:44 -0400
X-MC-Unique: Mmz6YHM_OiuVe7OHA1Sfnw-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 121FE1F45A;
 Fri,  8 Sep 2023 06:08:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8CAA5131FD;
 Fri,  8 Sep 2023 06:08:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CCFRIWq6+mQYaQAAMHmgww
 (envelope-from <hare@suse.de>); Fri, 08 Sep 2023 06:08:42 +0000
Message-ID: <bc365ee8-7fbf-4f1a-8ab9-901362bc257a@suse.de>
Date: Fri, 8 Sep 2023 08:08:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nitesh Shetty <nj.shetty@samsung.com>, Jens Axboe <axboe@kernel.dk>,
 Jonathan Corbet <corbet@lwn.net>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>, dm-devel@redhat.com,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>
References: <20230906163844.18754-1-nj.shetty@samsung.com>
 <CGME20230906164340epcas5p11ebd2dd93bd1c8bdb0c4452bfe059dd3@epcas5p1.samsung.com>
 <20230906163844.18754-7-nj.shetty@samsung.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20230906163844.18754-7-nj.shetty@samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [dm-devel] [PATCH v15 06/12] fs,
 block: copy_file_range for def_blk_ops for direct block device
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
Cc: martin.petersen@oracle.com, linux-doc@vger.kernel.org, gost.dev@samsung.com,
 Anuj Gupta <anuj20.g@samsung.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-block@vger.kernel.org, mcgrof@kernel.org,
 linux-fsdevel@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.de
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gOS82LzIzIDE4OjM4LCBOaXRlc2ggU2hldHR5IHdyb3RlOgo+IEZvciBkaXJlY3QgYmxvY2sg
ZGV2aWNlIG9wZW5lZCB3aXRoIE9fRElSRUNULCB1c2UgY29weV9maWxlX3JhbmdlIHRvCj4gaXNz
dWUgZGV2aWNlIGNvcHkgb2ZmbG9hZCwgYW5kIGZhbGxiYWNrIHRvIGdlbmVyaWNfY29weV9maWxl
X3JhbmdlIGluY2FzZQo+IGRldmljZSBjb3B5IG9mZmxvYWQgY2FwYWJpbGl0eSBpcyBhYnNlbnQg
b3IgdGhlIGRldmljZSBmaWxlcyBhcmUgbm90IG9wZW4KPiB3aXRoIE9fRElSRUNULgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEFudWogR3VwdGEgPGFudWoyMC5nQHNhbXN1bmcuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IE5pdGVzaCBTaGV0dHkgPG5qLnNoZXR0eUBzYW1zdW5nLmNvbT4KPiAtLS0KPiAgIGJs
b2NrL2ZvcHMuYyB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFu
Z2VkLCAyNSBpbnNlcnRpb25zKCspCj4gCgpSZXZpZXdlZC1ieTogSGFubmVzIFJlaW5lY2tlIDxo
YXJlQHN1c2UuZGU+CgpDaGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2UgICAg
ICAgICAgICAgICAgS2VybmVsIFN0b3JhZ2UgQXJjaGl0ZWN0CmhhcmVAc3VzZS5kZSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFH
IE7DvHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYsIEFuZHJldwpNeWVycywg
QW5kcmV3IE1jRG9uYWxkLCBNYXJ0amUgQm91ZGllbiBNb2VybWFuCgotLQpkbS1kZXZlbCBtYWls
aW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2RtLWRldmVsCg==

