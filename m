Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 029076DD3D3
	for <lists+dm-devel@lfdr.de>; Tue, 11 Apr 2023 09:15:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681197325;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9IYckAJOcpzcnNded9JzOcrZqn3kNG+EdSLeqo8FKA0=;
	b=DIeNzDu4080Dfh2TeeTbDCTXhrnQ+J7lC7sJNuxxtTn7WGplBbLPEUj+19/MSKqaVVCSkG
	tC2Vdf0hFyJ5beZpO9QMFTMJcwVa/vyFJmh5TYATk1hXJEYfk3uRW3IDnCZhk7ZXDeL85p
	BJLfkRK56z5EGvUti5gB9zH935FELDw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-33-zB2pXVuzP2q17LEkY6tqDQ-1; Tue, 11 Apr 2023 03:15:23 -0400
X-MC-Unique: zB2pXVuzP2q17LEkY6tqDQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26FAF858297;
	Tue, 11 Apr 2023 07:15:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 82580175AD;
	Tue, 11 Apr 2023 07:15:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2A6F91946A43;
	Tue, 11 Apr 2023 07:15:20 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E92D21946586
 for <dm-devel@listman.corp.redhat.com>; Tue, 11 Apr 2023 07:15:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D6BEE4020C82; Tue, 11 Apr 2023 07:15:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF6614020C80
 for <dm-devel@redhat.com>; Tue, 11 Apr 2023 07:15:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B49F5185A78B
 for <dm-devel@redhat.com>; Tue, 11 Apr 2023 07:15:18 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-596-REbnnk_DN_CvzhCCBQDs-w-1; Tue,
 11 Apr 2023 03:15:17 -0400
X-MC-Unique: REbnnk_DN_CvzhCCBQDs-w-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F332E1FE0B;
 Tue, 11 Apr 2023 07:15:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A9FA313519;
 Tue, 11 Apr 2023 07:15:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 77sRKAMJNWQXXgAAMHmgww
 (envelope-from <hare@suse.de>); Tue, 11 Apr 2023 07:15:15 +0000
Message-ID: <7ceeaeec-64c8-f58c-b792-1f43647887a1@suse.de>
Date: Tue, 11 Apr 2023 09:15:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
To: Mike Christie <michael.christie@oracle.com>, bvanassche@acm.org,
 hch@lst.de, martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 james.bottomley@hansenpartnership.com, linux-block@vger.kernel.org,
 dm-devel@redhat.com, snitzer@kernel.org, axboe@kernel.dk,
 linux-nvme@lists.infradead.org, chaitanyak@nvidia.com, kbusch@kernel.org,
 target-devel@vger.kernel.org
References: <20230407200551.12660-1-michael.christie@oracle.com>
 <20230407200551.12660-8-michael.christie@oracle.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20230407200551.12660-8-michael.christie@oracle.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [dm-devel] [PATCH v6 07/18] nvme: Fix reservation status
 related structs
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
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.de
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gNC83LzIzIDIyOjA1LCBNaWtlIENocmlzdGllIHdyb3RlOgo+IFRoaXMgZml4ZXMgdGhlIGZv
bGxvd2luZyBpc3N1ZXMgd2l0aCB0aGUgcmVzZXJ2YXRpb24gc3RhdHVzIHN0cnVjdHM6Cj4gCj4g
MS4gcmVzdjEwIGlzIGJ5dGVzIDIzOjEwIHNvIGl0IHNob3VsZCBiZSAxNCBieXRlcy4KPiAyLiBy
ZWdjdGxfZHMgb25seSBzdXBwb3J0cyA2NCBiaXQgaG9zdCBJRHMuCj4gCj4gVGhlc2UgYXJlIG5v
dCBjdXJyZW50bHkgdXNlZCwgYnV0IHdpbGwgYmUgaW4gdGhpcyBwYXRjaHNldCB3aGljaCBhZGRz
Cj4gc3VwcG9ydCBmb3IgdGhlIHJlc2VydmF0aW9uIHJlcG9ydCBjb21tYW5kLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IE1pa2UgQ2hyaXN0aWUgPG1pY2hhZWwuY2hyaXN0aWVAb3JhY2xlLmNvbT4KPiAt
LS0KPiAgIGluY2x1ZGUvbGludXgvbnZtZS5oIHwgMzggKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQo+IApSZXZpZXdlZC1ieTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+
CgpDaGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2UgICAgICAgICAgICAgICAg
S2VybmVsIFN0b3JhZ2UgQXJjaGl0ZWN0CmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdtYkgs
IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJuYmVyZyks
IEdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYsIEFuZHJldwpNeWVycywgQW5kcmV3IE1jRG9u
YWxkLCBNYXJ0amUgQm91ZGllbiBNb2VybWFuCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0t
ZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2RtLWRldmVsCg==

