Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D4A73AFEF
	for <lists+dm-devel@lfdr.de>; Fri, 23 Jun 2023 07:27:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687498020;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yMrHSMHd6OrYUGc6zfAaAx3SoHWeyy3rMGIIasza03E=;
	b=dGbp7Arje1C61lcDvXBQ7xxQAtAOvvsBzX9SVF2JxrfwuUaHqvRsyWzbAE6ULFtiKJohms
	VJdGnRUfHMegB2/8BuxTqpWXn1OAH76V7ZNpAmeFDeJ0F4rIW3i/59Fz8zCeMSNVJjShp4
	V+pi/TDGfCni/lIROMYS41w2EemOe4c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-aDqbb0G7NCqinqD0Smq1DQ-1; Fri, 23 Jun 2023 01:26:56 -0400
X-MC-Unique: aDqbb0G7NCqinqD0Smq1DQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8A811C07842;
	Fri, 23 Jun 2023 05:26:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C27E207B2C3;
	Fri, 23 Jun 2023 05:26:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 17299194F260;
	Fri, 23 Jun 2023 05:25:46 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C54061946587
 for <dm-devel@listman.corp.redhat.com>; Thu, 22 Jun 2023 17:42:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ACEEE200B402; Thu, 22 Jun 2023 17:42:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A51AA200A3AD
 for <dm-devel@redhat.com>; Thu, 22 Jun 2023 17:42:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 763F92999B33
 for <dm-devel@redhat.com>; Thu, 22 Jun 2023 17:42:07 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-yfCgbH94PbeezduhgaYruQ-1; Thu, 22 Jun 2023 13:42:01 -0400
X-MC-Unique: yfCgbH94PbeezduhgaYruQ-1
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1b54f5aac48so35000865ad.2
 for <dm-devel@redhat.com>; Thu, 22 Jun 2023 10:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687455720; x=1690047720;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YR6riefaBxO/qJacf8c9XUzeqz5GLT8THdv+ODXmKSw=;
 b=bqzjhotSnSxaF03+K1C1pGa9AZ8Qi/5kwqLuzGDaWiTle/C8XaHEgQGyt+y+eWbt1j
 TmqBrRenKbV1onkgSOlxDAs0AUpkVuzcnOEuKEy7FZsHL025DwyRO5n9h76p46VKCYXH
 o3A3Lfh4oa2Mjne/CTxkr4ONEIJn42LxPsU5fL3iN9U9rvB++Q2R4W7efVObIMBxne8A
 0tgotmQSa5S0S31/arvbAO0timUphCFLo9LMratYMIcw6xHJJPju3Kre64ECoBScg4su
 Khp8JuvDT2dhaIKCHWhqLq6Jeft02fTTdhlqNY45BOL15Yh2YgEGWJghjQpsV2+I3UNb
 2OrA==
X-Gm-Message-State: AC+VfDxyeoMv9MBITcYZKsohNK6HO/UPNUTt+NyJtowGDm+npiwYpw8i
 aQzcRwpFZIqs5lVm7Xd8zD0=
X-Google-Smtp-Source: ACHHUZ7evwZkAV8a0wVuAaIAW+pO3mkR7GW9pnxAUzkJDJVxa9Kkl4NfZezomSDymMDqt+DaH+7SkA==
X-Received: by 2002:a17:902:ecc8:b0:1b5:561a:5ca9 with SMTP id
 a8-20020a170902ecc800b001b5561a5ca9mr14043372plh.50.1687455719660; 
 Thu, 22 Jun 2023 10:41:59 -0700 (PDT)
Received: from [127.0.0.1] ([2402:d0c0:2:a2a::1])
 by smtp.gmail.com with ESMTPSA id
 jk14-20020a170903330e00b001b3d756a6f4sm5715243plb.13.2023.06.22.10.41.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Jun 2023 10:41:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <bfcf8b34-2efc-258e-bcec-d6ce10220205@bytedance.com>
Date: Fri, 23 Jun 2023 01:41:47 +0800
Message-Id: <43CEA22D-3FF5-40CB-BF07-0FB9829EF778@gmail.com>
References: <20230622085335.77010-1-zhengqi.arch@bytedance.com>
 <20230622085335.77010-25-zhengqi.arch@bytedance.com>
 <cf0d9b12-6491-bf23-b464-9d01e5781203@suse.cz>
 <bfcf8b34-2efc-258e-bcec-d6ce10220205@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Fri, 23 Jun 2023 05:25:40 +0000
Subject: Re: [dm-devel] [PATCH 24/29] mm: vmscan: make global slab shrink
 lockless
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, roman.gushchin@linux.dev,
 Dave Chinner <david@fromorbit.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-ext4@vger.kernel.org, paulmck@kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-nfs@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
 brauner@kernel.org, tytso@mit.edu, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Cj4gMjAyM+W5tDbmnIgyM+aXpSDkuIrljYgxMjo0Mu+8jFFpIFpoZW5nIDx6aGVuZ3FpLmFyY2hA
Ynl0ZWRhbmNlLmNvbT4g5YaZ6YGT77yaCj4gCj4gCj4gCj4gT24gMjAyMy82LzIyIDIzOjEyLCBW
bGFzdGltaWwgQmFia2Egd3JvdGU6Cj4+IE9uIDYvMjIvMjMgMTA6NTMsIFFpIFpoZW5nIHdyb3Rl
Ogo+Pj4gVGhlIHNocmlua2VyX3J3c2VtIGlzIGEgZ2xvYmFsIHJlYWQtd3JpdGUgbG9jayBpbgo+
Pj4gc2hyaW5rZXJzIHN1YnN5c3RlbSwgd2hpY2ggcHJvdGVjdHMgbW9zdCBvcGVyYXRpb25zCj4+
PiBzdWNoIGFzIHNsYWIgc2hyaW5rLCByZWdpc3RyYXRpb24gYW5kIHVucmVnaXN0cmF0aW9uCj4+
PiBvZiBzaHJpbmtlcnMsIGV0Yy4gVGhpcyBjYW4gZWFzaWx5IGNhdXNlIHByb2JsZW1zIGluCj4+
PiB0aGUgZm9sbG93aW5nIGNhc2VzLgo+Pj4gCj4+PiAxKSBXaGVuIHRoZSBtZW1vcnkgcHJlc3N1
cmUgaXMgaGlnaCBhbmQgdGhlcmUgYXJlIG1hbnkKPj4+ICAgIGZpbGVzeXN0ZW1zIG1vdW50ZWQg
b3IgdW5tb3VudGVkIGF0IHRoZSBzYW1lIHRpbWUsCj4+PiAgICBzbGFiIHNocmluayB3aWxsIGJl
IGFmZmVjdGVkIChkb3duX3JlYWRfdHJ5bG9jaygpCj4+PiAgICBmYWlsZWQpLgo+Pj4gCj4+PiAg
ICBTdWNoIGFzIHRoZSByZWFsIHdvcmtsb2FkIG1lbnRpb25lZCBieSBLaXJpbGwgVGtoYWk6Cj4+
PiAKPj4+ICAgIGBgYAo+Pj4gICAgT25lIG9mIHRoZSByZWFsIHdvcmtsb2FkcyBmcm9tIG15IGV4
cGVyaWVuY2UgaXMgc3RhcnQKPj4+ICAgIG9mIGFuIG92ZXJjb21taXR0ZWQgbm9kZSBjb250YWlu
aW5nIG1hbnkgc3RhcnRpbmcKPj4+ICAgIGNvbnRhaW5lcnMgYWZ0ZXIgbm9kZSBjcmFzaCAob3Ig
bWFueSByZXN1bWluZyBjb250YWluZXJzCj4+PiAgICBhZnRlciByZWJvb3QgZm9yIGtlcm5lbCB1
cGRhdGUpLiBJbiB0aGVzZSBjYXNlcyBtZW1vcnkKPj4+ICAgIHByZXNzdXJlIGlzIGh1Z2UsIGFu
ZCB0aGUgbm9kZSBnb2VzIHJvdW5kIGluIGxvbmcgcmVjbGFpbS4KPj4+ICAgIGBgYAo+Pj4gCj4+
PiAyKSBJZiBhIHNocmlua2VyIGlzIGJsb2NrZWQgKHN1Y2ggYXMgdGhlIGNhc2UgbWVudGlvbmVk
Cj4+PiAgICBpbiBbMV0pIGFuZCBhIHdyaXRlciBjb21lcyBpbiAoc3VjaCBhcyBtb3VudCBhIGZz
KSwKPj4+ICAgIHRoZW4gdGhpcyB3cml0ZXIgd2lsbCBiZSBibG9ja2VkIGFuZCBjYXVzZSBhbGwK
Pj4+ICAgIHN1YnNlcXVlbnQgc2hyaW5rZXItcmVsYXRlZCBvcGVyYXRpb25zIHRvIGJlIGJsb2Nr
ZWQuCj4+PiAKPj4+IEV2ZW4gaWYgdGhlcmUgaXMgbm8gY29tcGV0aXRvciB3aGVuIHNocmlua2lu
ZyBzbGFiLCB0aGVyZQo+Pj4gbWF5IHN0aWxsIGJlIGEgcHJvYmxlbS4gSWYgd2UgaGF2ZSBhIGxv
bmcgc2hyaW5rZXIgbGlzdAo+Pj4gYW5kIHdlIGRvIG5vdCByZWNsYWltIGVub3VnaCBtZW1vcnkg
d2l0aCBlYWNoIHNocmlua2VyLAo+Pj4gdGhlbiB0aGUgZG93bl9yZWFkX3RyeWxvY2soKSBtYXkg
YmUgY2FsbGVkIHdpdGggaGlnaAo+Pj4gZnJlcXVlbmN5LiBCZWNhdXNlIG9mIHRoZSBwb29yIG11
bHRpY29yZSBzY2FsYWJpbGl0eSBvZgo+Pj4gYXRvbWljIG9wZXJhdGlvbnMsIHRoaXMgY2FuIGxl
YWQgdG8gYSBzaWduaWZpY2FudCBkcm9wCj4+PiBpbiBJUEMgKGluc3RydWN0aW9ucyBwZXIgY3lj
bGUpLgo+Pj4gCj4+PiBXZSB1c2VkIHRvIGltcGxlbWVudCB0aGUgbG9ja2xlc3Mgc2xhYiBzaHJp
bmsgd2l0aAo+Pj4gU1JDVSBbMV0sIGJ1dCB0aGVuIGtlcm5lbCB0ZXN0IHJvYm90IHJlcG9ydGVk
IC04OC44JQo+Pj4gcmVncmVzc2lvbiBpbiBzdHJlc3MtbmcucmFtZnMub3BzX3Blcl9zZWMgdGVz
dCBjYXNlIFsyXSwKPj4+IHNvIHdlIHJldmVydGVkIGl0IFszXS4KPj4+IAo+Pj4gVGhpcyBjb21t
aXQgdXNlcyB0aGUgcmVmY291bnQrUkNVIG1ldGhvZCBbNF0gcHJvcG9zZWQgYnkKPj4+IGJ5IERh
dmUgQ2hpbm5lciB0byByZS1pbXBsZW1lbnQgdGhlIGxvY2tsZXNzIGdsb2JhbCBzbGFiCj4+PiBz
aHJpbmsuIFRoZSBtZW1jZyBzbGFiIHNocmluayBpcyBoYW5kbGVkIGluIHRoZSBzdWJzZXF1ZW50
Cj4+PiBwYXRjaC4KPj4+IAo+Pj4gQ3VycmVudGx5LCB0aGUgc2hyaW5rZXIgaW5zdGFuY2VzIGNh
biBiZSBkaXZpZGVkIGludG8KPj4+IHRoZSBmb2xsb3dpbmcgdGhyZWUgdHlwZXM6Cj4+PiAKPj4+
IGEpIGdsb2JhbCBzaHJpbmtlciBpbnN0YW5jZSBzdGF0aWNhbGx5IGRlZmluZWQgaW4gdGhlIGtl
cm5lbCwKPj4+IHN1Y2ggYXMgd29ya2luZ3NldF9zaGFkb3dfc2hyaW5rZXIuCj4+PiAKPj4+IGIp
IGdsb2JhbCBzaHJpbmtlciBpbnN0YW5jZSBzdGF0aWNhbGx5IGRlZmluZWQgaW4gdGhlIGtlcm5l
bAo+Pj4gbW9kdWxlcywgc3VjaCBhcyBtbXVfc2hyaW5rZXIgaW4geDg2Lgo+Pj4gCj4+PiBjKSBz
aHJpbmtlciBpbnN0YW5jZSBlbWJlZGRlZCBpbiBvdGhlciBzdHJ1Y3R1cmVzLgo+Pj4gCj4+PiBG
b3IgY2FzZSBhLCB0aGUgbWVtb3J5IG9mIHNocmlua2VyIGluc3RhbmNlIGlzIG5ldmVyIGZyZWVk
Lgo+Pj4gRm9yIGNhc2UgYiwgdGhlIG1lbW9yeSBvZiBzaHJpbmtlciBpbnN0YW5jZSB3aWxsIGJl
IGZyZWVkCj4+PiBhZnRlciB0aGUgbW9kdWxlIGlzIHVubG9hZGVkLiBCdXQgd2Ugd2lsbCBjYWxs
IHN5bmNocm9uaXplX3JjdSgpCj4+PiBpbiBmcmVlX21vZHVsZSgpIHRvIHdhaXQgZm9yIFJDVSBy
ZWFkLXNpZGUgY3JpdGljYWwgc2VjdGlvbiB0bwo+Pj4gZXhpdC4gRm9yIGNhc2UgYywgdGhlIG1l
bW9yeSBvZiBzaHJpbmtlciBpbnN0YW5jZSB3aWxsIGJlCj4+PiBkeW5hbWljYWxseSBmcmVlZCBi
eSBjYWxsaW5nIGtmcmVlX3JjdSgpLiBTbyB3ZSBjYW4gdXNlCj4+PiByY3VfcmVhZF97bG9jayx1
bmxvY2t9KCkgdG8gZW5zdXJlIHRoYXQgdGhlIHNocmlua2VyIGluc3RhbmNlCj4+PiBpcyB2YWxp
ZC4KPj4+IAo+Pj4gVGhlIHNocmlua2VyOjpyZWZjb3VudCBtZWNoYW5pc20gZW5zdXJlcyB0aGF0
IHRoZSBzaHJpbmtlcgo+Pj4gaW5zdGFuY2Ugd2lsbCBub3QgYmUgcnVuIGFnYWluIGFmdGVyIHVu
cmVnaXN0cmF0aW9uLiBTbyB0aGUKPj4+IHN0cnVjdHVyZSB0aGF0IHJlY29yZHMgdGhlIHBvaW50
ZXIgb2Ygc2hyaW5rZXIgaW5zdGFuY2UgY2FuIGJlCj4+PiBzYWZlbHkgZnJlZWQgd2l0aG91dCB3
YWl0aW5nIGZvciB0aGUgUkNVIHJlYWQtc2lkZSBjcml0aWNhbAo+Pj4gc2VjdGlvbi4KPj4+IAo+
Pj4gSW4gdGhpcyB3YXksIHdoaWxlIHdlIGltcGxlbWVudCB0aGUgbG9ja2xlc3Mgc2xhYiBzaHJp
bmssIHdlCj4+PiBkb24ndCBuZWVkIHRvIGJlIGJsb2NrZWQgaW4gdW5yZWdpc3Rlcl9zaHJpbmtl
cigpIHRvIHdhaXQKPj4+IFJDVSByZWFkLXNpZGUgY3JpdGljYWwgc2VjdGlvbi4KPj4+IAo+Pj4g
VGhlIGZvbGxvd2luZyBhcmUgdGhlIHRlc3QgcmVzdWx0czoKPj4+IAo+Pj4gc3RyZXNzLW5nIC0t
dGltZW91dCA2MCAtLXRpbWVzIC0tdmVyaWZ5IC0tbWV0cmljcy1icmllZiAtLXJhbWZzIDkgJgo+
Pj4gCj4+PiAxKSBCZWZvcmUgYXBwbHlpbmcgdGhpcyBwYXRjaHNldDoKPj4+IAo+Pj4gIHNldHRp
bmcgdG8gYSA2MCBzZWNvbmQgcnVuIHBlciBzdHJlc3Nvcgo+Pj4gIGRpc3BhdGNoaW5nIGhvZ3M6
IDkgcmFtZnMKPj4+ICBzdHJlc3NvciAgICAgICBib2dvIG9wcyByZWFsIHRpbWUgIHVzciB0aW1l
ICBzeXMgdGltZSAgIGJvZ28gb3BzL3MgICAgIGJvZ28gb3BzL3MKPj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIChzZWNzKSAgICAoc2VjcykgICAgKHNlY3MpICAgKHJlYWwgdGltZSkgKHVz
citzeXMgdGltZSkKPj4+ICByYW1mcyAgICAgICAgICAgIDg4MDYyMyAgICAgNjAuMDIgICAgICA3
LjcxICAgIDIyNi45MyAgICAgMTQ2NzEuNDUgICAgICAgIDM3NTMuMDkKPj4+ICByYW1mczoKPj4+
ICAgICAgICAgICAxIFN5c3RlbSBNYW5hZ2VtZW50IEludGVycnVwdAo+Pj4gIGZvciBhIDYwLjAz
cyBydW4gdGltZToKPj4+ICAgICA1NzYyLjQwcyBhdmFpbGFibGUgQ1BVIHRpbWUKPj4+ICAgICAg
ICA3LjcxcyB1c2VyIHRpbWUgICAoICAwLjEzJSkKPj4+ICAgICAgMjI2LjkzcyBzeXN0ZW0gdGlt
ZSAoICAzLjk0JSkKPj4+ICAgICAgMjM0LjY0cyB0b3RhbCB0aW1lICAoICA0LjA3JSkKPj4+ICBs
b2FkIGF2ZXJhZ2U6IDguNTQgMy4wNiAyLjExCj4+PiAgcGFzc2VkOiA5OiByYW1mcyAoOSkKPj4+
ICBmYWlsZWQ6IDAKPj4+ICBza2lwcGVkOiAwCj4+PiAgc3VjY2Vzc2Z1bCBydW4gY29tcGxldGVk
IGluIDYwLjAzcyAoMSBtaW4sIDAuMDMgc2VjcykKPj4+IAo+Pj4gMikgQWZ0ZXIgYXBwbHlpbmcg
dGhpcyBwYXRjaHNldDoKPj4+IAo+Pj4gIHNldHRpbmcgdG8gYSA2MCBzZWNvbmQgcnVuIHBlciBz
dHJlc3Nvcgo+Pj4gIGRpc3BhdGNoaW5nIGhvZ3M6IDkgcmFtZnMKPj4+ICBzdHJlc3NvciAgICAg
ICBib2dvIG9wcyByZWFsIHRpbWUgIHVzciB0aW1lICBzeXMgdGltZSAgIGJvZ28gb3BzL3MgICAg
IGJvZ28gb3BzL3MKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIChzZWNzKSAgICAoc2Vj
cykgICAgKHNlY3MpICAgKHJlYWwgdGltZSkgKHVzcitzeXMgdGltZSkKPj4+ICByYW1mcyAgICAg
ICAgICAgIDg0NzU2MiAgICAgNjAuMDIgICAgICA3LjQ0ICAgIDIzMC4yMiAgICAgMTQxMjAuNjYg
ICAgICAgIDM1NjYuMjMKPj4+ICByYW1mczoKPj4+ICAgICAgICAgICA0IFN5c3RlbSBNYW5hZ2Vt
ZW50IEludGVycnVwdHMKPj4+ICBmb3IgYSA2MC4xMnMgcnVuIHRpbWU6Cj4+PiAgICAgNTc3MS45
NXMgYXZhaWxhYmxlIENQVSB0aW1lCj4+PiAgICAgICAgNy40NHMgdXNlciB0aW1lICAgKCAgMC4x
MyUpCj4+PiAgICAgIDIzMC4yMnMgc3lzdGVtIHRpbWUgKCAgMy45OSUpCj4+PiAgICAgIDIzNy42
NnMgdG90YWwgdGltZSAgKCAgNC4xMiUpCj4+PiAgbG9hZCBhdmVyYWdlOiA4LjE4IDIuNDMgMC44
NAo+Pj4gIHBhc3NlZDogOTogcmFtZnMgKDkpCj4+PiAgZmFpbGVkOiAwCj4+PiAgc2tpcHBlZDog
MAo+Pj4gIHN1Y2Nlc3NmdWwgcnVuIGNvbXBsZXRlZCBpbiA2MC4xMnMgKDEgbWluLCAwLjEyIHNl
Y3MpCj4+PiAKPj4+IFdlIGNhbiBzZWUgdGhhdCB0aGUgb3BzL3MgaGFzIGhhcmRseSBjaGFuZ2Vk
Lgo+Pj4gCj4+PiBbMV0uIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzAzMTMxMTI4
MTkuMzg5MzgtMS16aGVuZ3FpLmFyY2hAYnl0ZWRhbmNlLmNvbS8KPj4+IFsyXS4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGttbC8yMDIzMDUyMzA4MzcuZGIyYzIzM2YteXVqaWUubGl1QGludGVs
LmNvbS8KPj4+IFszXS4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwNjA5MDgxNTE4
LjMwMzkxMjAtMS1xaS56aGVuZ0BsaW51eC5kZXYvCj4+PiBbNF0uIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xrbWwvWklKaG91MWQ1NWQ0SDFzMEBkcmVhZC5kaXNhc3Rlci5hcmVhLwo+Pj4gCj4+
PiBTaWduZWQtb2ZmLWJ5OiBRaSBaaGVuZyA8emhlbmdxaS5hcmNoQGJ5dGVkYW5jZS5jb20+Cj4+
PiAtLS0KPj4+ICBpbmNsdWRlL2xpbnV4L3Nocmlua2VyLmggfCAgNiArKysrKysKPj4+ICBtbS92
bXNjYW4uYyAgICAgICAgICAgICAgfCAzMyArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0KPj4+ICAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygt
KQo+Pj4gCj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zaHJpbmtlci5oIGIvaW5jbHVk
ZS9saW51eC9zaHJpbmtlci5oCj4+PiBpbmRleCA3YmZlYjJmMjUyNDYuLmIwYzZjMmRmOWRiOCAx
MDA2NDQKPj4+IC0tLSBhL2luY2x1ZGUvbGludXgvc2hyaW5rZXIuaAo+Pj4gKysrIGIvaW5jbHVk
ZS9saW51eC9zaHJpbmtlci5oCj4+PiBAQCAtNzQsNiArNzQsNyBAQCBzdHJ1Y3Qgc2hyaW5rZXIg
ewo+Pj4gICAgCXJlZmNvdW50X3QgcmVmY291bnQ7Cj4+PiAgCXN0cnVjdCBjb21wbGV0aW9uIGNv
bXBsZXRpb25fd2FpdDsKPj4+ICsJc3RydWN0IHJjdV9oZWFkIHJjdTsKPj4+ICAgIAl2b2lkICpw
cml2YXRlX2RhdGE7Cj4+PiAgQEAgLTEyMyw2ICsxMjQsMTEgQEAgc3RydWN0IHNocmlua2VyICpz
aHJpbmtlcl9hbGxvY19hbmRfaW5pdChjb3VudF9vYmplY3RzX2NiIGNvdW50LAo+Pj4gIHZvaWQg
c2hyaW5rZXJfZnJlZShzdHJ1Y3Qgc2hyaW5rZXIgKnNocmlua2VyKTsKPj4+ICB2b2lkIHVucmVn
aXN0ZXJfYW5kX2ZyZWVfc2hyaW5rZXIoc3RydWN0IHNocmlua2VyICpzaHJpbmtlcik7Cj4+PiAg
K3N0YXRpYyBpbmxpbmUgYm9vbCBzaHJpbmtlcl90cnlfZ2V0KHN0cnVjdCBzaHJpbmtlciAqc2hy
aW5rZXIpCj4+PiArewo+Pj4gKwlyZXR1cm4gcmVmY291bnRfaW5jX25vdF96ZXJvKCZzaHJpbmtl
ci0+cmVmY291bnQpOwo+Pj4gK30KPj4+ICsKPj4+ICBzdGF0aWMgaW5saW5lIHZvaWQgc2hyaW5r
ZXJfcHV0KHN0cnVjdCBzaHJpbmtlciAqc2hyaW5rZXIpCj4+PiAgewo+Pj4gIAlpZiAocmVmY291
bnRfZGVjX2FuZF90ZXN0KCZzaHJpbmtlci0+cmVmY291bnQpKQo+Pj4gZGlmZiAtLWdpdCBhL21t
L3Ztc2Nhbi5jIGIvbW0vdm1zY2FuLmMKPj4+IGluZGV4IDZmOWM0NzUwZWZmYS4uNzY3NTY5Njk4
OTQ2IDEwMDY0NAo+Pj4gLS0tIGEvbW0vdm1zY2FuLmMKPj4+ICsrKyBiL21tL3Ztc2Nhbi5jCj4+
PiBAQCAtNTcsNiArNTcsNyBAQAo+Pj4gICNpbmNsdWRlIDxsaW51eC9raHVnZXBhZ2VkLmg+Cj4+
PiAgI2luY2x1ZGUgPGxpbnV4L3JjdWxpc3RfbnVsbHMuaD4KPj4+ICAjaW5jbHVkZSA8bGludXgv
cmFuZG9tLmg+Cj4+PiArI2luY2x1ZGUgPGxpbnV4L3JjdWxpc3QuaD4KPj4+ICAgICNpbmNsdWRl
IDxhc20vdGxiZmx1c2guaD4KPj4+ICAjaW5jbHVkZSA8YXNtL2RpdjY0Lmg+Cj4+PiBAQCAtNzQy
LDcgKzc0Myw3IEBAIHZvaWQgcmVnaXN0ZXJfc2hyaW5rZXJfcHJlcGFyZWQoc3RydWN0IHNocmlu
a2VyICpzaHJpbmtlcikKPj4+ICAJZG93bl93cml0ZSgmc2hyaW5rZXJfcndzZW0pOwo+Pj4gIAly
ZWZjb3VudF9zZXQoJnNocmlua2VyLT5yZWZjb3VudCwgMSk7Cj4+PiAgCWluaXRfY29tcGxldGlv
bigmc2hyaW5rZXItPmNvbXBsZXRpb25fd2FpdCk7Cj4+PiAtCWxpc3RfYWRkX3RhaWwoJnNocmlu
a2VyLT5saXN0LCAmc2hyaW5rZXJfbGlzdCk7Cj4+PiArCWxpc3RfYWRkX3RhaWxfcmN1KCZzaHJp
bmtlci0+bGlzdCwgJnNocmlua2VyX2xpc3QpOwo+Pj4gIAlzaHJpbmtlci0+ZmxhZ3MgfD0gU0hS
SU5LRVJfUkVHSVNURVJFRDsKPj4+ICAJc2hyaW5rZXJfZGVidWdmc19hZGQoc2hyaW5rZXIpOwo+
Pj4gIAl1cF93cml0ZSgmc2hyaW5rZXJfcndzZW0pOwo+Pj4gQEAgLTgwMCw3ICs4MDEsNyBAQCB2
b2lkIHVucmVnaXN0ZXJfc2hyaW5rZXIoc3RydWN0IHNocmlua2VyICpzaHJpbmtlcikKPj4+ICAJ
d2FpdF9mb3JfY29tcGxldGlvbigmc2hyaW5rZXItPmNvbXBsZXRpb25fd2FpdCk7Cj4+PiAgICAJ
ZG93bl93cml0ZSgmc2hyaW5rZXJfcndzZW0pOwo+Pj4gLQlsaXN0X2RlbCgmc2hyaW5rZXItPmxp
c3QpOwo+Pj4gKwlsaXN0X2RlbF9yY3UoJnNocmlua2VyLT5saXN0KTsKPj4+ICAJc2hyaW5rZXIt
PmZsYWdzICY9IH5TSFJJTktFUl9SRUdJU1RFUkVEOwo+Pj4gIAlpZiAoc2hyaW5rZXItPmZsYWdz
ICYgU0hSSU5LRVJfTUVNQ0dfQVdBUkUpCj4+PiAgCQl1bnJlZ2lzdGVyX21lbWNnX3Nocmlua2Vy
KHNocmlua2VyKTsKPj4+IEBAIC04NDUsNyArODQ2LDcgQEAgRVhQT1JUX1NZTUJPTChzaHJpbmtl
cl9mcmVlKTsKPj4+ICB2b2lkIHVucmVnaXN0ZXJfYW5kX2ZyZWVfc2hyaW5rZXIoc3RydWN0IHNo
cmlua2VyICpzaHJpbmtlcikKPj4+ICB7Cj4+PiAgCXVucmVnaXN0ZXJfc2hyaW5rZXIoc2hyaW5r
ZXIpOwo+Pj4gLQlrZnJlZShzaHJpbmtlcik7Cj4+PiArCWtmcmVlX3JjdShzaHJpbmtlciwgcmN1
KTsKPj4+ICB9Cj4+PiAgRVhQT1JUX1NZTUJPTCh1bnJlZ2lzdGVyX2FuZF9mcmVlX3Nocmlua2Vy
KTsKPj4+ICBAQCAtMTA2NywzMyArMTA2OCwyNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBzaHJp
bmtfc2xhYihnZnBfdCBnZnBfbWFzaywgaW50IG5pZCwKPj4+ICAJaWYgKCFtZW1fY2dyb3VwX2Rp
c2FibGVkKCkgJiYgIW1lbV9jZ3JvdXBfaXNfcm9vdChtZW1jZykpCj4+PiAgCQlyZXR1cm4gc2hy
aW5rX3NsYWJfbWVtY2coZ2ZwX21hc2ssIG5pZCwgbWVtY2csIHByaW9yaXR5KTsKPj4+ICAtCWlm
ICghZG93bl9yZWFkX3RyeWxvY2soJnNocmlua2VyX3J3c2VtKSkKPj4+IC0JCWdvdG8gb3V0Owo+
Pj4gLQo+Pj4gLQlsaXN0X2Zvcl9lYWNoX2VudHJ5KHNocmlua2VyLCAmc2hyaW5rZXJfbGlzdCwg
bGlzdCkgewo+Pj4gKwlyY3VfcmVhZF9sb2NrKCk7Cj4+PiArCWxpc3RfZm9yX2VhY2hfZW50cnlf
cmN1KHNocmlua2VyLCAmc2hyaW5rZXJfbGlzdCwgbGlzdCkgewo+Pj4gIAkJc3RydWN0IHNocmlu
a19jb250cm9sIHNjID0gewo+Pj4gIAkJCS5nZnBfbWFzayA9IGdmcF9tYXNrLAo+Pj4gIAkJCS5u
aWQgPSBuaWQsCj4+PiAgCQkJLm1lbWNnID0gbWVtY2csCj4+PiAgCQl9Owo+Pj4gICsJCWlmICgh
c2hyaW5rZXJfdHJ5X2dldChzaHJpbmtlcikpCj4+PiArCQkJY29udGludWU7Cj4+PiArCQlyY3Vf
cmVhZF91bmxvY2soKTsKPj4gSSBkb24ndCB0aGluayB5b3UgY2FuIGRvIHRoaXMgdW5sb2NrPwo+
Pj4gKwo+Pj4gIAkJcmV0ID0gZG9fc2hyaW5rX3NsYWIoJnNjLCBzaHJpbmtlciwgcHJpb3JpdHkp
Owo+Pj4gIAkJaWYgKHJldCA9PSBTSFJJTktfRU1QVFkpCj4+PiAgCQkJcmV0ID0gMDsKPj4+ICAJ
CWZyZWVkICs9IHJldDsKPj4+IC0JCS8qCj4+PiAtCQkgKiBCYWlsIG91dCBpZiBzb21lb25lIHdh
bnQgdG8gcmVnaXN0ZXIgYSBuZXcgc2hyaW5rZXIgdG8KPj4+IC0JCSAqIHByZXZlbnQgdGhlIHJl
Z2lzdHJhdGlvbiBmcm9tIGJlaW5nIHN0YWxsZWQgZm9yIGxvbmcgcGVyaW9kcwo+Pj4gLQkJICog
YnkgcGFyYWxsZWwgb25nb2luZyBzaHJpbmtpbmcuCj4+PiAtCQkgKi8KPj4+IC0JCWlmIChyd3Nl
bV9pc19jb250ZW5kZWQoJnNocmlua2VyX3J3c2VtKSkgewo+Pj4gLQkJCWZyZWVkID0gZnJlZWQg
PyA6IDE7Cj4+PiAtCQkJYnJlYWs7Cj4+PiAtCQl9Cj4+PiAtCX0KPj4+ICAtCXVwX3JlYWQoJnNo
cmlua2VyX3J3c2VtKTsKPj4+IC1vdXQ6Cj4+PiArCQlyY3VfcmVhZF9sb2NrKCk7Cj4+IFRoYXQg
bmV3IHJjdV9yZWFkX2xvY2soKSB3b24ndCBoZWxwIEFGQUlLLCB0aGUgd2hvbGUKPj4gbGlzdF9m
b3JfZWFjaF9lbnRyeV9yY3UoKSBuZWVkcyB0byBiZSB1bmRlciB0aGUgc2luZ2xlIHJjdV9yZWFk
X2xvY2soKSB0byBiZQo+PiBzYWZlLgo+IAo+IEluIHRoZSB1bnJlZ2lzdGVyX3Nocmlua2VyKCkg
cGF0aCwgd2Ugd2lsbCB3YWl0IGZvciB0aGUgcmVmY291bnQgdG8gemVybwo+IGJlZm9yZSBkZWxl
dGluZyB0aGUgc2hyaW5rZXIgZnJvbSB0aGUgbGlua2VkIGxpc3QuIEhlcmUsIHdlIGZpcnN0IHRv
b2sKPiB0aGUgcmN1IGxvY2ssIGFuZCB0aGVuIGRlY3JlbWVudCB0aGUgcmVmY291bnQgb2YgdGhp
cyBzaHJpbmtlci4KPiAKPiAgICBzaHJpbmtfc2xhYiAgICAgICAgICAgICAgICAgdW5yZWdpc3Rl
cl9zaHJpbmtlcgo+ICAgID09PT09PT09PT09ICAgICAgICAgICAgICAgICA9PT09PT09PT09PT09
PT09PT09Cj4gCQkJCQo+IAkJCQkvKiB3YWl0IGZvciBCICovCj4gCQkJCXdhaXRfZm9yX2NvbXBs
ZXRpb24oKQo+ICByY3VfcmVhZF9sb2NrKCkKPiAKPiAgc2hyaW5rZXJfcHV0KCkgLS0+IChCKQo+
IAkJCQlsaXN0X2RlbF9yY3UoKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB3
YWl0IGZvciByY3VfcmVhZF91bmxvY2soKSAqLwo+IAkJCQlrZnJlZV9yY3UoKQo+IAo+ICAvKgo+
ICAgKiBzbyB0aGlzIHNocmlua2VyIHdpbGwgbm90IGJlIGZyZWVkIGhlcmUsCj4gICAqIGFuZCBj
YW4gYmUgdXNlZCB0byB0cmF2ZXJzZSB0aGUgbmV4dCBub2RlCj4gICAqIG5vcm1hbGx5Pwo+ICAg
Ki8KPiAgbGlzdF9mb3JfZWFjaF9lbnRyeSgpCj4gCj4gIHNocmlua2VyX3RyeV9nZXQoKQo+ICBy
Y3VfcmVhZF91bmxvY2soKQo+IAo+IERpZCBJIG1pc3Mgc29tZXRoaW5nPwoKQWZ0ZXIgY2FsbGlu
ZyByY3VfcmVhZF91bmxvY2soKSwgdGhlIG5leHQgc2hyaW5rZXIgaW4gdGhlIGxpc3QgY2FuIGJl
IGZyZWVkLApzbyBpbiB0aGUgbmV4dCBpdGVyYXRpb24sIHVzZSBhZnRlciBmcmVlIG1pZ2h0IGhh
cHBlbj8KCklzIHRoYXQgcmlnaHQ/Cgo+IAo+PiBJSVVDIHRoaXMgaXMgd2h5IERhdmUgaW4gWzRd
IHN1Z2dlc3RzIHVuaWZ5aW5nIHNocmlua19zbGFiKCkgd2l0aAo+PiBzaHJpbmtfc2xhYl9tZW1j
ZygpLCBhcyB0aGUgbGF0dGVyIGRvZXNuJ3QgaXRlcmF0ZSB0aGUgbGlzdCBidXQgdXNlcyBJRFIu
Cj4+PiArCQlzaHJpbmtlcl9wdXQoc2hyaW5rZXIpOwo+Pj4gKwl9Cj4+PiArCXJjdV9yZWFkX3Vu
bG9jaygpOwo+Pj4gIAljb25kX3Jlc2NoZWQoKTsKPj4+ICAJcmV0dXJuIGZyZWVkOwo+Pj4gIH0K
Ci0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vbGlz
dG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWwK

