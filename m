Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1FB6825D9
	for <lists+dm-devel@lfdr.de>; Tue, 31 Jan 2023 08:49:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675151357;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZsVu1ayPRWuH1Y6A/LyX3C2o6ymKuiBOo7mvz83TDUg=;
	b=KkDKWM6jmOPAKaSIJK0MNdX7Be4y0VzRT05zWebqegbdZnA1zV0eS991G2sATUyWtduCtl
	91uc5iTS+aK+nbfyPsW4JxX7nhkgUalSDf6c2nmXrlKVNB7Mn8GxAnKCLhuCmJZquxjRxF
	6dzTtH6MLRadV44l5ui0pYz5rxDq5Bo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-GiTZ_gInPEqDjqr6rItD_w-1; Tue, 31 Jan 2023 02:49:15 -0500
X-MC-Unique: GiTZ_gInPEqDjqr6rItD_w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4034E280605D;
	Tue, 31 Jan 2023 07:49:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E9CF52166B35;
	Tue, 31 Jan 2023 07:49:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 786E519465A3;
	Tue, 31 Jan 2023 07:49:12 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3D8561946589
 for <dm-devel@listman.corp.redhat.com>; Mon, 30 Jan 2023 23:06:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 319C4C16021; Mon, 30 Jan 2023 23:06:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2867BC16020
 for <dm-devel@redhat.com>; Mon, 30 Jan 2023 23:06:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03B92800B23
 for <dm-devel@redhat.com>; Mon, 30 Jan 2023 23:06:40 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
 relay.mimecast.com with ESMTP id us-mta-207-H4n9BtZwN_GFPdukbDyI6w-1; Mon,
 30 Jan 2023 18:06:38 -0500
X-MC-Unique: H4n9BtZwN_GFPdukbDyI6w-1
Received: by linux.microsoft.com (Postfix, from userid 1052)
 id E04B220E9FB1; Mon, 30 Jan 2023 14:58:41 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E04B220E9FB1
From: Fan Wu <wufan@linux.microsoft.com>
To: corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com,
 tytso@mit.edu, ebiggers@kernel.org, axboe@kernel.dk, agk@redhat.com,
 snitzer@kernel.org, eparis@redhat.com, paul@paul-moore.com
Date: Mon, 30 Jan 2023 14:57:15 -0800
Message-Id: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Tue, 31 Jan 2023 07:47:16 +0000
Subject: [dm-devel] [RFC PATCH v9 00/16] Integrity Policy Enforcement LSM
 (IPE)
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
Cc: Fan Wu <wufan@linux.microsoft.com>, dm-devel@redhat.com,
 linux-doc@vger.kernel.org, roberto.sassu@huawei.com,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-audit@redhat.com, linux-integrity@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T3ZlcnZpZXc6Ci0tLS0tLS0tLQoKSVBFIGlzIGEgTGludXggU2VjdXJpdHkgTW9kdWxlIHdoaWNo
IHRha2VzIGEgY29tcGxpbWVudGFyeSBhcHByb2FjaCB0bwphY2Nlc3MgY29udHJvbC4gV2hlcmVh
cyBleGlzdGluZyBtYW5kYXRvcnkgYWNjZXNzIGNvbnRyb2wgbWVjaGFuaXNtcwpiYXNlIHRoZWly
IGRlY2lzaW9ucyBvbiBsYWJlbHMgYW5kIHBhdGhzLCBJUEUgaW5zdGVhZCBkZXRlcm1pbmVzCndo
ZXRoZXIgb3Igbm90IGFuIG9wZXJhdGlvbiBzaG91bGQgYmUgYWxsb3dlZCBiYXNlZCBvbiBpbW11
dGFibGUKc2VjdXJpdHkgcHJvcGVydGllcyBvZiB0aGUgc3lzdGVtIGNvbXBvbmVudCB0aGUgb3Bl
cmF0aW9uIGlzIGJlaW5nCnBlcmZvcm1lZCBvbi4KCklQRSBpdHNlbGYgZG9lcyBub3QgbWFuZGF0
ZSBob3cgdGhlIHNlY3VyaXR5IHByb3BlcnR5IHNob3VsZCBiZQpldmFsdWF0ZWQsIGJ1dCByZWxp
ZXMgb24gYW4gZXh0ZW5zaWJsZSBzZXQgb2YgZXh0ZXJuYWwgcHJvcGVydHkgcHJvdmlkZXJzCnRv
IGV2YWx1YXRlIHRoZSBjb21wb25lbnQuIElQRSBtYWtlcyBpdHMgZGVjaXNpb24gYmFzZWQgb24g
cmVmZXJlbmNlCnZhbHVlcyBmb3IgdGhlIHNlbGVjdGVkIHByb3BlcnRpZXMsIHNwZWNpZmllZCBp
biB0aGUgSVBFIHBvbGljeS4KClRoZSByZWZlcmVuY2UgdmFsdWVzIHJlcHJlc2VudCB0aGUgdmFs
dWUgdGhhdCB0aGUgcG9saWN5IHdyaXRlciBhbmQgdGhlCmxvY2FsIHN5c3RlbSBhZG1pbmlzdHJh
dG9yIChiYXNlZCBvbiB0aGUgcG9saWN5IHNpZ25hdHVyZSkgdHJ1c3QgZm9yIHRoZQpzeXN0ZW0g
dG8gYWNjb21wbGlzaCB0aGUgZGVzaXJlZCB0YXNrcy4KCk9uZSBzdWNoIHByb3ZpZGVyIGlzIGZv
ciBleGFtcGxlIGRtLXZlcml0eSwgd2hpY2ggaXMgYWJsZSB0byByZXByZXNlbnQKdGhlIGludGVn
cml0eSBwcm9wZXJ0eSBvZiBhIHBhcnRpdGlvbiAoaXRzIGltbXV0YWJsZSBzdGF0ZSkgd2l0aCBh
IGRpZ2VzdC4KCklQRSBpcyBjb21waWxlZCB1bmRlciBDT05GSUdfU0VDVVJJVFlfSVBFLgoKVXNl
IENhc2VzCi0tLS0tLS0tLQoKSVBFIHdvcmtzIGJlc3QgaW4gZml4ZWQtZnVuY3Rpb24gZGV2aWNl
czogRGV2aWNlcyBpbiB3aGljaCB0aGVpciBwdXJwb3NlCmlzIGNsZWFybHkgZGVmaW5lZCBhbmQg
bm90IHN1cHBvc2VkIHRvIGJlIGNoYW5nZWQgKGUuZy4gbmV0d29yayBmaXJld2FsbApkZXZpY2Ug
aW4gYSBkYXRhIGNlbnRlciwgYW4gSW9UIGRldmljZSwgZXRjZXRlcmEpLCB3aGVyZSBhbGwgc29m
dHdhcmUgYW5kCmNvbmZpZ3VyYXRpb24gaXMgYnVpbHQgYW5kIHByb3Zpc2lvbmVkIGJ5IHRoZSBz
eXN0ZW0gb3duZXIuCgpJUEUgaXMgYSBsb25nLXdheSBvZmYgZm9yIHVzZSBpbiBnZW5lcmFsLXB1
cnBvc2UgY29tcHV0aW5nOiB0aGUgTGludXgKY29tbXVuaXR5IGFzIGEgd2hvbGUgdGVuZHMgdG8g
Zm9sbG93IGEgZGVjZW50cmFsaXplZCB0cnVzdCBtb2RlbCwKa25vd24gYXMgdGhlIHdlYiBvZiB0
cnVzdCwgd2hpY2ggSVBFIGhhcyBubyBzdXBwb3J0IGZvciBhcyBvZiAgeWV0LgpUaGVyZSBhcmUg
ZXhjZXB0aW9ucywgc3VjaCBhcyB0aGUgY2FzZSB3aGVyZSBhIExpbnV4IGRpc3RyaWJ1dGlvbgp2
ZW5kb3IgdHJ1c3RzIG9ubHkgdGhlaXIgb3duIGtleXMsIHdoZXJlIElQRSBjYW4gc3VjY2Vzc2Z1
bGx5IGJlIHVzZWQKdG8gZW5mb3JjZSB0aGUgdHJ1c3QgcmVxdWlyZW1lbnQuCgpBZGRpdGlvbmFs
bHksIHdoaWxlIG1vc3QgcGFja2FnZXMgYXJlIHNpZ25lZCB0b2RheSwgdGhlIGZpbGVzIGluc2lk
ZQp0aGUgcGFja2FnZXMgKGZvciBpbnN0YW5jZSwgdGhlIGV4ZWN1dGFibGVzKSwgdGVuZCB0byBi
ZSB1bnNpZ25lZC4gVGhpcwptYWtlcyBpdCBkaWZmaWN1bHQgdG8gdXRpbGl6ZSBJUEUgaW4gc3lz
dGVtcyB3aGVyZSBhIHBhY2thZ2UgbWFuYWdlciBpcwpleHBlY3RlZCB0byBiZSBmdW5jdGlvbmFs
LCB3aXRob3V0IG1ham9yIGNoYW5nZXMgdG8gdGhlIHBhY2thZ2UgbWFuYWdlcgphbmQgZWNvc3lz
dGVtIGJlaGluZCBpdC4KCkRJR0xJTVsxXSBpcyBhIHN5c3RlbSB0aGF0IHdoZW4gY29tYmluZWQg
d2l0aCBJUEUsIGNvdWxkIGJlIHVzZWQgdG8KZW5hYmxlIGdlbmVyYWwgcHVycG9zZSBjb21wdXRp
bmcgc2NlbmFyaW9zLgoKUG9saWN5OgotLS0tLS0tCgpJUEUgcG9saWN5IGlzIGEgcGxhaW4tdGV4
dCBwb2xpY3kgY29tcG9zZWQgb2YgbXVsdGlwbGUgc3RhdGVtZW50cwpvdmVyIHNldmVyYWwgbGlu
ZXMuIFRoZXJlIGlzIG9uZSByZXF1aXJlZCBsaW5lLCBhdCB0aGUgdG9wIG9mIHRoZQpwb2xpY3ks
IGluZGljYXRpbmcgdGhlIHBvbGljeSBuYW1lLCBhbmQgdGhlIHBvbGljeSB2ZXJzaW9uLCBmb3IK
aW5zdGFuY2U6CgogIHBvbGljeV9uYW1lPUV4X1BvbGljeSBwb2xpY3lfdmVyc2lvbj0wLjAuMAoK
VGhlIHBvbGljeSB2ZXJzaW9uIGluZGljYXRlcyB0aGUgY3VycmVudCB2ZXJzaW9uIG9mIHRoZSBw
b2xpY3kuIFRoaXMgaXMKdXNlZCB0byBwcmV2ZW50IHJvbGwtYmFjayBvZiBwb2xpY3kgdG8gcG90
ZW50aWFsbHkgaW5zZWN1cmUgcHJldmlvdXMKdmVyc2lvbnMgb2YgdGhlIHBvbGljeS4KClRoZSBu
ZXh0IHBvcnRpb24gb2YgSVBFIHBvbGljeSwgYXJlIHJ1bGVzLiBSdWxlcyBhcmUgZm9ybWVkIGJ5
IGtleT12YWx1ZQpwYWlycywga25vd24gYXMgcHJvcGVydGllcy4gSVBFIHJ1bGVzIHJlcXVpcmUg
dHdvIGtleXM6ICJhY3Rpb24iLCB3aGljaApkZXRlcm1pbmVzIHdoYXQgSVBFIGRvZXMgd2hlbiBp
dCBlbmNvdW50ZXJzIGEgbWF0Y2ggYWdhaW5zdCB0aGUgcG9saWN5CmFuZCAib3AiLCB3aGljaCBk
ZXRlcm1pbmVzIHdoZW4gdGhhdCBydWxlIHNob3VsZCBiZSBldmFsdWF0ZWQuCgpUaHVzLCBhIG1p
bmltYWwgcnVsZSBpczoKCiAgb3A9RVhFQ1VURSBhY3Rpb249QUxMT1cKClRoaXMgZXhhbXBsZSBy
dWxlIHdpbGwgYWxsb3cgYW55IGV4ZWN1dGlvbi4gQSBydWxlIGlzIHJlcXVpcmVkIHRvIGhhdmUg
dGhlCiJvcCIgcHJvcGVydHkgYXMgdGhlIGZpcnN0IHRva2VuIG9mIGEgcnVsZSwgYW5kIHRoZSAi
YWN0aW9uIiBhcyB0aGUgbGFzdAp0b2tlbiBvZiB0aGUgcnVsZS4gCgpBZGRpdGlvbmFsIHByb3Bl
cnRpZXMgYXJlIHVzZWQgdG8gcmVzdHJpY3QgYXR0cmlidXRlcyBhYm91dCB0aGUgZmlsZXMgYmVp
bmcKZXZhbHVhdGVkLiBUaGVzZSBwcm9wZXJ0aWVzIGFyZSBpbnRlbmRlZCB0byBiZSBkZXRlcm1p
bmlzdGljIGF0dHJpYnV0ZXMKdGhhdCBhcmUgcmVzaWRlbnQgaW4gdGhlIGtlcm5lbC4gCgpGb3Ig
ZXhhbXBsZToKCiAgb3A9RVhFQ1VURSBkbXZlcml0eV9zaWduYXR1cmU9RkFMU0UgYWN0aW9uPURF
TlkKClRoaXMgcnVsZSB3aXRoIHByb3BlcnR5IGRtdmVyaXR5X3NpZ25hdHVyZSB3aWxsIGRlbnkg
YW55IGZpbGUgbm90IGZyb20KYSBzaWduZWQgZG12ZXJpdHkgdm9sdW1lIHRvIGJlIGV4ZWN1dGVk
LiAKCkFsbCBhdmFpbGFibGUgcHJvcGVydGllcyBmb3IgSVBFIGRlc2NyaWJlZCBpbiB0aGUgZG9j
dW1lbnRhdGlvbiBwYXRjaCBvZgp0aGlzIHNlcmllcy4KClJ1bGVzIGFyZSBldmFsdWF0ZWQgdG9w
LXRvLWJvdHRvbS4gQXMgYSByZXN1bHQsIGFueSByZXZvY2F0aW9uIHJ1bGVzLApvciBkZW5pZXMg
c2hvdWxkIGJlIHBsYWNlZCBlYXJseSBpbiB0aGUgZmlsZSB0byBlbnN1cmUgdGhhdCB0aGVzZSBy
dWxlcwphcmUgZXZhbHVhdGVkIGJlZm9yZSBhIHJ1bGUgd2l0aCAiYWN0aW9uPUFMTE9XIiBpcyBo
aXQuCgpBbnkgdW5rbm93biBzeW50YXggaW4gSVBFIHBvbGljeSB3aWxsIHJlc3VsdCBpbiBhIGZh
dGFsIGVycm9yIHRvIHBhcnNlCnRoZSBwb2xpY3kuIAoKQWRkaXRpb25hbGx5LCBhIERFRkFVTFQg
b3BlcmF0aW9uIG11c3QgYmUgc2V0IGZvciBhbGwgdW5kZXJzdG9vZApvcGVyYXRpb25zIHdpdGhp
biBJUEUuIEZvciBwb2xpY2llcyB0byByZW1haW4gY29tcGxldGVseSBmb3J3YXJkcwpjb21wYXRp
YmxlLCBpdCBpcyByZWNvbW1lbmRlZCB0aGF0IHVzZXJzIGFkZCBhICJERUZBVUxUIGFjdGlvbj1B
TExPVyIKYW5kIG92ZXJyaWRlIHRoZSBkZWZhdWx0cyBvbiBhIHBlci1vcGVyYXRpb24gYmFzaXMu
CgpGb3IgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgcG9saWN5IHN5bnRheCwgc2VlIHRoZSBr
ZXJuZWwKZG9jdW1lbnRhdGlvbiBwYWdlLgoKRWFybHkgVXNlcm1vZGUgUHJvdGVjdGlvbjoKLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCklQRSBjYW4gYmUgcHJvdmlkZWQgd2l0aCBhIHBvbGlj
eSBhdCBzdGFydHVwIHRvIGxvYWQgYW5kIGVuZm9yY2UuClRoaXMgaXMgaW50ZW5kZWQgdG8gYmUg
YSBtaW5pbWFsIHBvbGljeSB0byBnZXQgdGhlIHN5c3RlbSB0byBhIHN0YXRlCndoZXJlIHVzZXJz
cGFjZSBpcyBzZXR1cCBhbmQgcmVhZHkgdG8gcmVjZWl2ZSBjb21tYW5kcywgYXQgd2hpY2gKcG9p
bnQgYSBwb2xpY3kgY2FuIGJlIGRlcGxveWVkIHZpYSBzZWN1cml0eWZzLiBUaGlzICJib290IHBv
bGljeSIgY2FuIGJlCnNwZWNpZmllZCB2aWEgdGhlIGNvbmZpZywgU0VDVVJJVFlfSVBFX0JPT1Rf
UE9MSUNZLCB3aGljaCBhY2NlcHRzIGEgcGF0aAp0byBhIHBsYWluLXRleHQgdmVyc2lvbiBvZiB0
aGUgSVBFIHBvbGljeSB0byBhcHBseS4gVGhpcyBwb2xpY3kgd2lsbCBiZQpjb21waWxlZCBpbnRv
IHRoZSBrZXJuZWwuIElmIG5vdCBzcGVjaWZpZWQsIElQRSB3aWxsIGJlIGRpc2FibGVkIHVudGls
IGEKcG9saWN5IGlzIGRlcGxveWVkIGFuZCBhY3RpdmF0ZWQgdGhyb3VnaCB0aGUgbWV0aG9kIGFi
b3ZlLgoKUG9saWN5IEV4YW1wbGVzOgotLS0tLS0tLS0tLS0tLS0tCgpBbGxvdyBhbGw6CgogIHBv
bGljeV9uYW1lPUFsbG93X0FsbCBwb2xpY3lfdmVyc2lvbj0wLjAuMAogIERFRkFVTFQgYWN0aW9u
PUFMTE9XCgpBbGxvdyBvbmx5IGluaXRpYWwgc3VwZXJibG9jazoKCiAgcG9saWN5X25hbWU9QWxs
b3dfQWxsX0luaXRpYWxfU0IgcG9saWN5X3ZlcnNpb249MC4wLjAKICBERUZBVUxUIGFjdGlvbj1E
RU5ZCgogIG9wPUVYRUNVVEUgYm9vdF92ZXJpZmllZD1UUlVFIGFjdGlvbj1BTExPVwoKQWxsb3cg
YW55IHNpZ25lZCBkbS12ZXJpdHkgdm9sdW1lIGFuZCB0aGUgaW5pdGlhbCBzdXBlcmJsb2NrOgoK
ICBwb2xpY3lfbmFtZT1BbGxvd1NpZ25lZEFuZEluaXRpYWwgcG9saWN5X3ZlcnNpb249MC4wLjAK
ICBERUZBVUxUIGFjdGlvbj1ERU5ZCgogIG9wPUVYRUNVVEUgYm9vdF92ZXJpZmllZD1UUlVFIGFj
dGlvbj1BTExPVwogIG9wPUVYRUNVVEUgZG12ZXJpdHlfc2lnbmF0dXJlPVRSVUUgYWN0aW9uPUFM
TE9XCgpQcm9oaWJpdCBleGVjdXRpb24gZnJvbSBhIHNwZWNpZmljIGRtLXZlcml0eSB2b2x1bWUs
IHdoaWxlIGFsbG93aW5nCmFsbCBzaWduZWQgdm9sdW1lcyBhbmQgdGhlIGluaXRpYWwgc3VwZXJi
bG9jazoKCiAgcG9saWN5X25hbWU9UHJvaGliaXRTaW5nbGVWb2x1bWUgcG9saWN5X3ZlcnNpb249
MC4wLjAKICBERUZBVUxUIGFjdGlvbj1ERU5ZCgogIG9wPUVYRUNVVEUgZG12ZXJpdHlfcm9vdGhh
c2g9c2hhMjU2OjQwMWZjZWM1OTQ0ODIzYWUxMmY2MjcyNmU4MTg0NDA3YTVmYTk1OTk3ODNmMDMw
ZGVjMTQ2OTM4IGFjdGlvbj1ERU5ZCiAgb3A9RVhFQ1VURSBib290X3ZlcmlmaWVkPVRSVUUgYWN0
aW9uPUFMTE9XCiAgb3A9RVhFQ1VURSBkbXZlcml0eV9zaWduYXR1cmU9VFJVRSBhY3Rpb249QUxM
T1cKCkFsbG93IG9ubHkgYSBzcGVjaWZpYyBkbS12ZXJpdHkgdm9sdW1lOgoKICBwb2xpY3lfbmFt
ZT1BbGxvd1NwZWNpZmljIHBvbGljeV92ZXJzaW9uPTAuMC4wCiAgREVGQVVMVCBhY3Rpb249REVO
WQoKICBvcD1FWEVDVVRFIGRtdmVyaXR5X3Jvb3RoYXNoPXNoYTI1Njo0MDFmY2VjNTk0NDgyM2Fl
MTJmNjI3MjZlODE4NDQwN2E1ZmE5NTk5NzgzZjAzMGRlYzE0NjkzOCBhY3Rpb249QUxMT1cKCkFs
bG93IGFueSBzaWduZWQgZnMtdmVyaXR5IGZpbGUKCiAgcG9saWN5X25hbWU9IkFsbG93U2lnbmVk
RlNWZXJpdHkiIHBvbGljeV92ZXJzaW9uPTAuMC4wCiAgREVGQVVMVCBhY3Rpb249REVOWQoKICBv
cD1FWEVDVVRFIGZzdmVyaXR5X3NpZ25hdHVyZT1UUlVFIGFjdGlvbj1BTExPVwoKRGVueSBhIHNw
ZWNpZmljIGZzLXZlcml0eSBmaWxlOgoKICBwb2xpY3lfbmFtZT0iUHJvaGliaXRTcGVjaWZpY0ZT
VkYiIHBvbGljeV92ZXJzaW9uPTAuMC4wCiAgREVGQVVMVCBhY3Rpb249REVOWQoKICBvcD1FWEVD
VVRFIGZzdmVyaXR5X2RpZ2VzdD1zaGEyNTY6ZmQ4OGYyYjg4MjRlMTk3Zjg1MGJmNGM1MTA5YmVh
NWNmMGVlMzgxMDRmNzEwODQzYmI3MmRhNzk2YmE1YWY5ZSBhY3Rpb249REVOWQogIG9wPUVYRUNV
VEUgYm9vdF92ZXJpZmllZD1UUlVFIGFjdGlvbj1BTExPVwogIG9wPUVYRUNVVEUgZG12ZXJpdHlf
c2lnbmF0dXJlPVRSVUUgYWN0aW9uPUFMTE9XCgpEZXBsb3lpbmcgUG9saWNpZXM6Ci0tLS0tLS0t
LS0tLS0tLS0tLS0KCkZpcnN0IHNpZ24gYSBwbGFpbiB0ZXh0IHBvbGljeSwgd2l0aCBhIGNlcnRp
ZmljYXRlIHRoYXQgaXMgcHJlc2VudCBpbgp0aGUgU1lTVEVNX1RSVVNURURfS0VZUklORyBvZiB5
b3VyIHRlc3QgbWFjaGluZS4gVGhyb3VnaCBvcGVuc3NsLCB0aGUKc2lnbmluZyBjYW4gYmUgZG9u
ZSB2aWE6CgogIG9wZW5zc2wgc21pbWUgLXNpZ24gLWluICIkTVlfUE9MSUNZIiAtc2lnbmVyICIk
TVlfQ0VSVElGSUNBVEUiIFwKICAgIC1pbmtleSAiJE1ZX1BSSVZBVEVfS0VZIiAtb3V0Zm9ybSBk
ZXIgLW5vYXR0ciAtbm9kZXRhY2ggXAogICAgLW91dCAiJE1ZX1BPTElDWS5wN3MiCgpUaGVuLCBz
aW1wbHkgY2F0IHRoZSBmaWxlIGludG8gdGhlIElQRSdzICJuZXdfcG9saWN5IiBzZWN1cml0eWZz
IG5vZGU6CgogIGNhdCAiJE1ZX1BPTElDWS5wN3MiID4gL3N5cy9rZXJuZWwvc2VjdXJpdHkvaXBl
L25ld19wb2xpY3kKClRoZSBwb2xpY3kgc2hvdWxkIG5vdyBiZSBwcmVzZW50IHVuZGVyIHRoZSBw
b2xpY2llcy8gc3ViZGlyZWN0b3J5LCB1bmRlcgppdHMgInBvbGljeV9uYW1lIiBhdHRyaWJ1dGUu
CgpUaGUgcG9saWN5IGlzIG5vdyBwcmVzZW50IGluIHRoZSBrZXJuZWwgYW5kIGNhbiBiZSBtYXJr
ZWQgYXMgYWN0aXZlLAp2aWEgdGhlIHNlY3VyaXR5ZnMgbm9kZToKCiAgZWNobyAxID4gIi9zeXMv
a2VybmVsL3NlY3VyaXR5L2lwZS8kTVlfUE9MSUNZX05BTUUvYWN0aXZlIgoKVGhpcyB3aWxsIG5v
dyBtYXJrIHRoZSBwb2xpY3kgYXMgYWN0aXZlIGFuZCB0aGUgc3lzdGVtIHdpbGwgYmUgZW5mb3Jj
aW5nCiRNWV9QT0xJQ1lfTkFNRS4KClRoZXJlIGlzIG9uZSByZXF1aXJlbWVudCB3aGVuIG1hcmtp
bmcgYSBwb2xpY3kgYXMgYWN0aXZlLCB0aGUgcG9saWN5X3ZlcnNpb24KYXR0cmlidXRlIG11c3Qg
ZWl0aGVyIGluY3JlYXNlLCBvciByZW1haW4gdGhlIHNhbWUgYXMgdGhlIGN1cnJlbnRseSBydW5u
aW5nCnBvbGljeS4KClBvbGljaWVzIGNhbiBiZSB1cGRhdGVkIHZpYToKCiAgY2F0ICIkTVlfVVBE
QVRFRF9QT0xJQ1kucDdzIiA+IFwKICAgICIvc3lzL2tlcm5lbC9zZWN1cml0eS9pcGUvcG9saWNp
ZXMvJE1ZX1BPTElDWV9OQU1FL3VwZGF0ZSIKCkFkZGl0aW9uYWxseSwgcG9saWNpZXMgY2FuIGJl
IGRlbGV0ZWQgdmlhIHRoZSAiZGVsZXRlIiBzZWN1cml0eWZzCm5vZGUuIFNpbXBseSB3cml0ZSAi
MSIgdG8gdGhlIGNvcnJlc3BvbmRpbmcgbm9kZSBpbiB0aGUgcG9saWN5IGZvbGRlcjoKCiAgZWNo
byAxID4gIi9zeXMva2VybmVsL3NlY3VyaXR5L2lwZS9wb2xpY2llcy8kTVlfUE9MSUNZX05BTUUv
ZGVsZXRlIgoKVGhlcmUgaXMgb25seSBvbmUgcmVxdWlyZW1lbnQgdG8gZGVsZXRlIHBvbGljaWVz
LCB0aGUgcG9saWN5IGJlaW5nCmRlbGV0ZWQgbXVzdCBub3QgYmUgdGhlIGFjdGl2ZSBwb2xpY3ku
CgpOT1RFOiBBbnkgc2VjdXJpdHlmcyB3cml0ZSB0byBJUEUncyBub2RlcyB3aWxsIHJlcXVpcmUg
Q0FQX01BQ19BRE1JTi4KCkludGVncmF0aW9uczoKLS0tLS0tLS0tLS0tLQoKVGhpcyBwYXRjaCBz
ZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBmc3Zlcml0eSB2aWEgZGlnZXN0IGFuZCBzaWduYXR1cmUK
KGZzdmVyaXR5X3NpZ25hdHVyZSBhbmQgZnN2ZXJpdHlfZGlnZXN0KSwgZG0tdmVyaXR5IGJ5IGRp
Z2VzdCBhbmQKc2lnbmF0dXJlIChkbXZlcml0eV9zaWduYXR1cmUgYW5kIGRtdmVyaXR5X3Jvb3Ro
YXNoKSwgYW5kIHRydXN0IGZvcgp0aGUgaW5pdHJhbWZzIChib290X3ZlcmlmaWVkKS4KClBsZWFz
ZSBzZWUgdGhlIGRvY3VtZW50YXRpb24gcGF0Y2ggZm9yIG1vcmUgaW5mb3JtYXRpb24gYWJvdXQg
dGhlCmludGVncmF0aW9ucyBhdmFpbGFibGUuCgpUZXN0aW5nOgotLS0tLS0tLQoKS1VuaXQgVGVz
dHMgYXJlIGF2YWlsYWJsZS4gUmVjb21tZW5kZWQga3VuaXRjb25maWc6CgogICAgQ09ORklHX0tV
TklUPXkKICAgIENPTkZJR19TRUNVUklUWT15CiAgICBDT05GSUdfU0VDVVJJVFlGUz15CiAgICBD
T05GSUdfUEtDUzdfTUVTU0FHRV9QQVJTRVI9eQogICAgQ09ORklHX1NZU1RFTV9EQVRBX1ZFUklG
SUNBVElPTj15CiAgICBDT05GSUdfRlNfVkVSSVRZPXkKICAgIENPTkZJR19GU19WRVJJVFlfQlVJ
TFRJTl9TSUdOQVRVUkVTPXkKICAgIENPTkZJR19CTE9DSz15CiAgICBDT05GSUdfTUQ9eQogICAg
Q09ORklHX0JMS19ERVZfRE09eQogICAgQ09ORklHX0RNX1ZFUklUWT15CiAgICBDT05GSUdfRE1f
VkVSSVRZX1ZFUklGWV9ST09USEFTSF9TSUc9eQogICAgQ09ORklHX05FVD15CiAgICBDT05GSUdf
QVVESVQ9eQogICAgQ09ORklHX0FVRElUU1lTQ0FMTD15CgogICAgQ09ORklHX1NFQ1VSSVRZX0lQ
RT15CiAgICBDT05GSUdfSVBFX1BST1BfRE1fVkVSSVRZPXkKICAgIENPTkZJR19JUEVfUFJPUF9G
U19WRVJJVFk9eQogICAgQ09ORklHX1NFQ1VSSVRZX0lQRV9LVU5JVF9URVNUPXkKClNpbXBseSBy
dW46CgogICAgbWFrZSBBUkNIPXVtIG1ycHJvcGVyCiAgICAuL3Rvb2xzL3Rlc3Rpbmcva3VuaXQv
a3VuaXQucHkgcnVuIC0ta3VuaXRjb25maWcgPHBhdGgvdG8vY29uZmlnPgoKQW5kIHRoZSB0ZXN0
cyB3aWxsIGV4ZWN1dGUgYW5kIHJlcG9ydCB0aGUgcmVzdWx0LiBGb3IgbW9yZSBpbmRlcHRoIHRl
c3RpbmcsCml0IHdpbGwgcmVxdWlyZSB5b3UgdG8gY3JlYXRlIGFuZCBtb3VudCBhIGRtLXZlcml0
eSB2b2x1bWUgb3IgZnMtdmVyaXR5CmVuYWJsZWQgZmlsZS4KCkRvY3VtZW50YXRpb246Ci0tLS0t
LS0tLS0tLS0tCgpUaGVyZSBpcyBib3RoIGRvY3VtZW50YXRpb24gYXZhaWxhYmxlIG9uIGdpdGh1
YiBhdApodHRwczovL21pY3Jvc29mdC5naXRodWIuaW8vaXBlLCBhbmQgRG9jdW1lbnRhdGlvbiBp
biB0aGlzIHBhdGNoIHNlcmllcywKdG8gYmUgYWRkZWQgaW4tdHJlZS4KCktub3duIEdhcHM6Ci0t
LS0tLS0tLS0tCgpJUEUgaGFzIHR3byBrbm93biBnYXBzOgoKMS4gSVBFIGNhbm5vdCB2ZXJpZnkg
dGhlIGludGVncml0eSBvZiBhbm9ueW1vdXMgZXhlY3V0YWJsZSBtZW1vcnksIHN1Y2ggYXMKICB0
aGUgdHJhbXBvbGluZXMgY3JlYXRlZCBieSBnY2MgY2xvc3VyZXMgYW5kIGxpYmZmaSAoPDMuNC4y
KSwgb3IgSklUJ2QgY29kZS4KICBVbmZvcnR1bmF0ZWx5LCBhcyB0aGlzIGlzIGR5bmFtaWNhbGx5
IGdlbmVyYXRlZCBjb2RlLCB0aGVyZSBpcyBubyB3YXkKICBmb3IgSVBFIHRvIGVuc3VyZSB0aGUg
aW50ZWdyaXR5IG9mIHRoaXMgY29kZSB0byBmb3JtIGEgdHJ1c3QgYmFzaXMuIEluIGFsbAogIGNh
c2VzLCB0aGUgcmV0dXJuIHJlc3VsdCBmb3IgdGhlc2Ugb3BlcmF0aW9ucyB3aWxsIGJlIHdoYXRl
dmVyIHRoZSBhZG1pbgogIGNvbmZpZ3VyZXMgdGhlIERFRkFVTFQgYWN0aW9uIGZvciAiRVhFQ1VU
RSIuCgoyLiBJUEUgY2Fubm90IHZlcmlmeSB0aGUgaW50ZWdyaXR5IG9mIGludGVycHJldGVkIGxh
bmd1YWdlcycgcHJvZ3JhbXMgd2hlbgogIHRoZXNlIHNjcmlwdHMgaW52b2tlZCB2aWEgYGA8aW50
ZXJwcmV0ZXI+IDxmaWxlPmBgLiBUaGlzIGlzIGJlY2F1c2UgdGhlCiAgd2F5IGludGVycHJldGVy
cyBleGVjdXRlIHRoZXNlIGZpbGVzLCB0aGUgc2NyaXB0cyB0aGVtc2VsdmVzIGFyZSBub3QKICBl
dmFsdWF0ZWQgYXMgZXhlY3V0YWJsZSBjb2RlIHRocm91Z2ggb25lIG9mIElQRSdzIGhvb2tzLiBJ
bnRlcnByZXRlcnMKICBjYW4gYmUgZW5saWdodGVuZWQgdG8gdGhlIHVzYWdlIG9mIElQRSBieSB0
cnlpbmcgdG8gbW1hcCBhIGZpbGUgaW50bwogIGV4ZWN1dGFibGUgbWVtb3J5ICgrWCksIGFmdGVy
IG9wZW5pbmcgdGhlIGZpbGUgYW5kIHJlc3BvbmRpbmcgdG8gdGhlCiAgZXJyb3IgY29kZSBhcHBy
b3ByaWF0ZWx5LiBUaGlzIGFsc28gYXBwbGllcyB0byBpbmNsdWRlZCBmaWxlcywgb3IgaGlnaAog
IHZhbHVlIGZpbGVzLCBzdWNoIGFzIGNvbmZpZ3VyYXRpb24gZmlsZXMgb2YgY3JpdGljYWwgc3lz
dGVtIGNvbXBvbmVudHMuCgpBcHBlbmRpeDoKLS0tLS0tLS0tCgpBLiBJUEUgR2l0aHViIFJlcG9z
aXRvcnk6IGh0dHBzOi8vZ2l0aHViLmNvbS9taWNyb3NvZnQvaXBlCkIuIElQRSBVc2VycycgR3Vp
ZGU6IERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvTFNNL2lwZS5yc3QKClJlZmVyZW5jZXM6Ci0t
LS0tLS0tLS0tCgoxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYvNGQ2OTMyZTk2ZDc3NDIy
N2I0MjcyMWQ5ZjY0NWJhNTFAaHVhd2VpLmNvbS9ULwoKRkFROgotLS0tCgpROiBXaGF0IGlzIHRo
ZSBkaWZmZXJlbmNlIGJldHdlZW4gSU1BIGFuZCBJUEU/CgpBOiBTZWUgdGhlIGRvY3VtZW50YXRp
b24gcGF0Y2ggZm9yIG1vcmUgb24gdGhpcyB0b3BpYy4KClByZXZpb3VzIFBvc3RpbmdzCi0tLS0t
LS0tLS0tLS0tLS0tCgp2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjAwNDA2MTgx
MDQ1LjEwMjQxNjQtMS1kZXZlbi5kZXNhaUBsaW51eC5taWNyb3NvZnQuY29tLwp2MjogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjAwNDA2MjIxNDM5LjE0Njk4NjItMS1kZXZlbi5kZXNh
aUBsaW51eC5taWNyb3NvZnQuY29tLwp2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIw
MjAwNDE1MTYyNTUwLjIzMjQtMS1kZXZlbi5kZXNhaUBsaW51eC5taWNyb3NvZnQuY29tLwp2NDog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjAwNzE3MjMwOTQxLjExOTA3NDQtMS1kZXZl
bi5kZXNhaUBsaW51eC5taWNyb3NvZnQuY29tLwp2NTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzIwMjAwNzI4MjEzNjE0LjU4NjMxMi0xLWRldmVuLmRlc2FpQGxpbnV4Lm1pY3Jvc29mdC5j
b20vCnY2OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMDA3MzAwMDMxMTMuMjU2MTY0
NC0xLWRldmVuLmRlc2FpQGxpbnV4Lm1pY3Jvc29mdC5jb20vCnY3OiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMTYzNDE1MTk5NS0xNjI2Ni0xLWdpdC1zZW5kLWVtYWlsLWRldmVuLmRlc2Fp
QGxpbnV4Lm1pY3Jvc29mdC5jb20vCnY4OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMTY1
NDcxNDg4OS0yNjcyOC0xLWdpdC1zZW5kLWVtYWlsLWRldmVuLmRlc2FpQGxpbnV4Lm1pY3Jvc29m
dC5jb20vCgpDaGFuZ2Vsb2c6Ci0tLS0tLS0tLS0KCnYyOgogIFNwbGl0IHRoZSBzZWNvbmQgcGF0
Y2ggb2YgdGhlIHByZXZpb3VzIHNlcmllcyBpbnRvIHR3by4KICBNaW5vciBjb3JyZWN0aW9ucyBp
biB0aGUgY292ZXItbGV0dGVyIGFuZCBkb2N1bWVudGF0aW9uCiAgY29tbWVudHMgcmVnYXJkaW5n
IENBUF9NQUNfQURNSU4gY2hlY2tzIGluIElQRS4KCnYzOgogIEFkZHJlc3MgdmFyaW91cyBjb21t
ZW50cyBieSBKYW5uIEhvcm4uIEhpZ2hsaWdodHM6CiAgICBTd2l0Y2ggdmFyaW91cyBhdWRpdCBh
bGxvY2F0b3JzIHRvIEdGUF9LRVJORUwuCiAgICBVdGlsaXplIHJjdV9hY2Nlc3NfcG9pbnRlcigp
IGluIHZhcmlvdXMgbG9jYXRpb25zLgogICAgU3RyaXAgb3V0IHRoZSBjYWNoaW5nIHN5c3RlbSBm
b3IgcHJvcGVydGllcwogICAgU3RyaXAgY29tbWVudHMgZnJvbSBoZWFkZXJzCiAgICBNb3ZlIGZ1
bmN0aW9ucyBhcm91bmQgaW4gcGF0Y2hlcwogICAgUmVtb3ZlIGtlcm5lbCBjb21tYW5kIGxpbmUg
cGFyYW1ldGVycwogICAgUmVjb25jaWxlIHRoZSByYWNlIGNvbmRpdGlvbiBvbiB0aGUgZGVsZXRl
IG5vZGUgZm9yIHBvbGljeSBieQogICAgICBleHBhbmRpbmcgdGhlIHBvbGljeSBjcml0aWNhbCBz
ZWN0aW9uLgoKICBBZGRyZXNzIGEgZmV3IGNvbW1lbnRzIGJ5IEpvbmF0aGFuIENvcmJldCBhcm91
bmQgdGhlIGRvY3VtZW50YXRpb24KICAgIHBhZ2VzIGZvciBJUEUuCgogIEZpeCBhbiBpc3N1ZSB3
aXRoIHRoZSBpbml0aWFsaXphdGlvbiBvZiBJUEUgcG9saWN5IHdpdGggYSAiLTAiCiAgICB2ZXJz
aW9uLCBjYXVzZWQgYnkgbm90IGluaXRpYWxpemluZyB0aGUgaGxpc3QgZW50cmllcyBiZWZvcmUK
ICAgIGZyZWVpbmcuCgp2NDoKICBBZGRyZXNzIGEgY29uY2VybiBhcm91bmQgSVBFJ3MgYmVoYXZp
b3Igd2l0aCB1bmtub3duIHN5bnRheC4KICAgIFNwZWNpZmljYWxseSwgbWFrZSBhbnkgdW5rbm93
biBzeW50YXggYSBmYXRhbCBlcnJvciBpbnN0ZWFkIG9mIGEKICAgIHdhcm5pbmcsIGFzIHN1Z2dl
c3RlZCBieSBNaWNrYcOrbCBTYWxhw7xuLgogIEludHJvZHVjZSBhIG5ldyBzZWN1cml0eWZzIG5v
ZGUsICRzZWN1cml0eWZzL2lwZS9wcm9wZXJ0eV9jb25maWcsCiAgICB3aGljaCBwcm92aWRlcyBh
IGxpc3Rpbmcgb2Ygd2hhdCBwcm9wZXJ0aWVzIGFyZSBlbmFibGVkIGJ5IHRoZQogICAga2VybmVs
IGFuZCB0aGVpciB2ZXJzaW9ucy4gVGhpcyBhbGxvd3MgdXNlcm1vZGUgdG8gcHJlZGljdCB3aGF0
CiAgICBwb2xpY2llcyBzaG91bGQgYmUgYWxsb3dlZC4KICBTdHJpcCBzb21lIGNvbW1lbnRzIGZy
b20gYyBmaWxlcyB0aGF0IEkgbWlzc2VkLgogIENsYXJpZnkgc29tZSBkb2N1bWVudGF0aW9uIGNv
bW1lbnRzIGFyb3VuZCAnYm9vdF92ZXJpZmllZCcuCiAgICBXaGlsZSB0aGlzIGN1cnJlbnRseSBk
b2VzIG5vdCBmdW5jdGlvbmFsbHkgY2hhbmdlIHRoZSBwcm9wZXJ0eQogICAgaXRzZWxmLCB0aGUg
ZGlzdGluY3Rpb24gaXMgaW1wb3J0YW50IHdoZW4gSVBFIGNhbiBlbmZvcmNlIHZlcmlmaWVkCiAg
ICByZWFkcy4gQWRkaXRpb25hbGx5LCAnS0VSTkVMX1JFQUQnIHdhcyBvbWl0dGVkIGZyb20gdGhl
IGRvY3VtZW50YXRpb24uCiAgICBUaGlzIGhhcyBiZWVuIGNvcnJlY3RlZC4KICBDaGFuZ2UgU2Vj
dXJpdHlGUyBhbmQgU0hBMSB0byBhIHJldmVyc2UgZGVwZW5kZW5jeS4KICBVcGRhdGUgdGhlIGNv
dmVyLWxldHRlciB3aXRoIHRoZSB1cGRhdGVkIGJlaGF2aW9yIG9mIHVua25vd24gc3ludGF4Lgog
IFJlbW92ZSBhbGwgc3lzY3RscywgbWFraW5nIGFuIGVxdWl2YWxlbnQgZnVuY3Rpb24gaW4gc2Vj
dXJpdHlmcy4KICBSZXdvcmsgdGhlIGFjdGl2ZS9kZWxldGUgbWVjaGFuaXNtIHRvIGJlIGEgbm9k
ZSB1bmRlciB0aGUgcG9saWN5IGluCiAgICAkc2VjdXJpdHlmcy9pcGUvcG9saWNpZXMuCiAgVGhl
IGtlcm5lbCBjb21tYW5kIGxpbmUgcGFyYW1ldGVycyBpcGUuZW5mb3JjZSBhbmQgaXBlLnN1Y2Nl
c3NfYXVkaXQKICAgIGhhdmUgcmV0dXJuZWQgYXMgdGhpcyBmdW5jdGlvbmFsaXR5IGlzIG5vIGxv
bmdlciBleHBvc2VkIHRocm91Z2gKICAgIHN5c2ZzLgoKdjU6CiAgQ29ycmVjdCBzb21lIGdyYW1t
YXRpY2FsIGVycm9ycyByZXBvcnRlZCBieSBSYW5keSBEdW5sYXAuCiAgRml4IHNvbWUgd2Fybmlu
Z3MgcmVwb3J0ZWQgYnkga2VybmVsIHRlc3QgYm90LgogIENoYW5nZSBjb252ZW50aW9uIGFyb3Vu
ZCBzZWN1cml0eV9iZGV2X3NldHNlY3VyaXR5LiAtRU5PU1lTCiAgICBpcyBub3cgZXhwZWN0ZWQg
aWYgYW4gTFNNIGRvZXMgbm90IGltcGxlbWVudCBhIHBhcnRpY3VsYXIgQG5hbWUsCiAgICBhcyBz
dWdnZXN0ZWQgYnkgQ2FzZXkgU2NoYXVmbGVyLgogIE1pbm9yIHN0cmluZyBjb3JyZWN0aW9ucyBy
ZWxhdGVkIHRvIHRoZSBtb3ZlIGZyb20gc3lzZnMgdG8gc2VjdXJpdHlmcwogIENvcnJlY3QgYSBz
cGVsbGluZyBvZiBhbiAjaWZkZWYgZm9yIHRoZSBwZXJtaXNzaXZlIGFyZ3VtZW50LgogIEFkZCB0
aGUga2VybmVsIHBhcmFtZXRlcnMgcmUtYWRkZWQgdG8gdGhlIGRvY3VtZW50YXRpb24uCiAgRml4
IGEgbWlub3IgYnVnIHdoZXJlIHRoZSBtb2RlIGJlaW5nIGF1ZGl0ZWQgb24gcGVybWlzc2l2ZSBz
d2l0Y2gKICAgIHdhcyB0aGUgb3JpZ2luYWwgbW9kZSwgbm90IHRoZSBtb2RlIGJlaW5nIHN3YXBw
ZWQgdG8uCiAgQ2xlYW51cCBkb2MgY29tbWVudHMsIGZpeCBzb21lIHdoaXRlc3BhY2UgYWxpZ25t
ZW50IGlzc3Vlcy4KCnY2OgogIENoYW5nZSBpZiBzdGF0ZW1lbnQgY29uZGl0aW9uIGluIHNlY3Vy
aXR5X2JkZXZfc2V0c2VjdXJpdHkgdG8gYmUKICAgIG1vcmUgY29uY2lzZSwgYXMgc3VnZ2VzdGVk
IGJ5IENhc2V5IFNjaGF1ZmxlciBhbmQgQWwgVmlybwogIERyb3AgdGhlIDZ0aCBwYXRjaCBpbiB0
aGUgc2VyaWVzLCAiZG0tdmVyaXR5IG1vdmUgc2lnbmF0dXJlIGNoZWNrLi4uIgogICAgZHVlIHRv
IG51bWVyb3VzIGlzc3VlcywgYW5kIGl0IHVsdGltYXRlbHkgcHJvdmlkaW5nIG5vIHJlYWwgdmFs
dWUuCiAgRml4IHRoZSBwYXRjaCB0cmVlIC0gdGhlIHByZXZpb3VzIGl0ZXJhdGlvbiBhcHBlYXJz
IHRvIGhhdmUgYmVlbiBpbiBhCiAgICB0b3JuIHN0YXRlIChwYXRjaGVzIDgrOSB3ZXJlIG1lcmdl
ZCkuIFRoaXMgaGFzIHNpbmNlIGJlZW4gY29ycmVjdGVkLgoKdjc6CiAgKiBSZXdvcmQgY292ZXIg
bGV0dGVyIHRvIG1vcmUgYWNjdXJhdGUgY29udmV5IElQRSdzIHB1cnBvc2UKICAgIGFuZCBsYXRl
c3QgdXBkYXRlcy4KICAqIFJlZmFjdG9yIHNlcmllcyB0bzoKICAgICAgMS4gU3VwcG9ydCBhIGNv
bnRleHQgc3RydWN0dXJlLCBlbmFibGluZzoKICAgICAgICAgIDEuIEVhc2llciBUZXN0aW5nIHZp
YSBLVU5JVAogICAgICAgICAgMi4gQSBiZXR0ZXIgYXJjaGl0ZWN0dXJlIGZvciBmdXR1cmUgZGVz
aWducwogICAgICAyLiBNYWtlIHBhcnNlciBjb2RlIGNsZWFuZXIKICAqIE1vdmUgcGF0Y2ggMDEv
MTIgdG8gWzE0LzE2XSBvZiB0aGUgc2VyaWVzCiAgKiBTcGxpdCB1cCBwYXRjaCAwMi8xMiBpbnRv
IGZvdXIgcGFydHM6CiAgICAgIDEuIGNvbnRleHQgY3JlYXRpb24gWzAxLzE2XQogICAgICAyLiBh
dWRpdCBbMDcvMTZdCiAgICAgIDMuIGV2YWx1YXRpb24gbG9vcCBbMDMvMTZdCiAgICAgIDQuIGFj
Y2VzcyBjb250cm9sIGhvb2tzIFswNS8xNl0KICAgICAgNS4gcGVybWlzc2l2ZSBtb2RlIFswOC8x
Nl0KICAqIFNwbGl0IHVwIHBhdGNoIDAzLzEyIGludG8gdHdvIHBhcnRzOgogICAgICAxLiBwYXJz
ZXIgWzAyLzE2XQogICAgICAyLiB1c2Vyc3BhY2UgaW50ZXJmYWNlIFswNC8xNl0KICAqIFJld29y
ZCBhbmQgcmVmYWN0b3IgcGF0Y2ggMDQvMTIgdG8gWzA5LzE2XQogICogU3F1YXNoIHBhdGNoIDA1
LzEyLCAwNy8xMiwgMDkvMTIgdG8gWzEwLzE2XQogICogU3F1YXNoIHBhdGNoIDA4LzEyLCAxMC8x
MiB0byBbMTEvMTZdCiAgKiBDaGFuZ2UgYXVkaXQgcmVjb3JkcyB0byBNQUMgcmVnaW9uICgxNFhY
KSBmcm9tIEludGVncml0eSByZWdpb24gKDE4WFgpCiAgKiBBZGQgRlNWZXJpdHkgU3VwcG9ydAog
ICogSW50ZXJmYWNlIGNoYW5nZXM6CiAgICAgIDEuICJyYXciIHdhcyByZW5hbWVkIHRvICJwa2Nz
NyIgYW5kIG1hZGUgcmVhZCBvbmx5CiAgICAgIDIuICJyYXciJ3Mgd3JpdGUgZnVuY3Rpb25hbGl0
eSAodXBkYXRlIGEgcG9saWN5KSBtb3ZlZCB0byAidXBkYXRlIgogICAgICAzLiBpbnRyb2R1Y2Vk
ICJ2ZXJzaW9uIiwgInBvbGljeV9uYW1lIiBub2Rlcy4KICAgICAgNC4gImNvbnRlbnQiIHJlbmFt
ZWQgdG8gInBvbGljeSIKICAgICAgNS4gVGhlIGJvb3QgcG9saWN5IGNhbiBub3cgYmUgdXBkYXRl
ZCBsaWtlIGFueSBvdGhlciBwb2xpY3kuCiAgKiBBZGQgYWRkaXRpb25hbCBkZXZlbG9wZXItbGV2
ZWwgZG9jdW1lbnRhdGlvbgogICogVXBkYXRlIGFkbWluLWd1aWRlIGRvY3MgdG8gcmVmbGVjdCBj
aGFuZ2VzLgogICogS3VuaXQgdGVzdHMKICAqIERyb3BwZWQgQ09ORklHX1NFQ1VSSVRZX0lQRV9Q
RVJNSVNTSVZFX1NXSVRDSCAtIGZ1bmN0aW9uYWxpdHkgY2FuCiAgICBlYXNpbHkgY29tZSBsYXRl
ciB3aXRoIGEgc21hbGwgcGF0Y2guCiAgKiBVc2UgcGFydGl0aW9uMCBmb3IgYmxvY2tfZGV2aWNl
IGZvciBkbS12ZXJpdHkgcGF0Y2gKCnY4OgogICogQWRkIGNoYW5nZWxvZyBpbmZvcm1hdGlvbiB0
byBpbmRpdmlkdWFsIGNvbW1pdHMKICAqIEEgbGFyZ2UgbnVtYmVyIG9mIGNoYW5nZXMgdG8gdGhl
IGF1ZGl0IHBhdGNoLgogICogc3BsaXQgZnMvICYgc2VjdXJpdHkvIGNoYW5nZXMgdG8gdHdvIHNl
cGFyYXRlIHBhdGNoZXMuCiAgKiBzcGxpdCBibG9jay8sIHNlY3VyaXR5LyAmIGRyaXZlcnMvbWQv
IGNoYW5nZXMgdG8gc2VwYXJhdGUgcGF0Y2hlcy4KICAqIEFkZCBzb21lIGhpc3RvcmljYWwgY29u
dGV4dCB0byB3aGF0IGxlYWQgdG8gdGhlIGNyZWF0aW9uIG9mIElQRQogICAgaW4gdGhlIGRvY3Vt
ZW50YXRpb24gcGF0Y2guCiAgKiBDb3Zlci1sZXR0ZXIgY2hhbmdlcyBzdWdnZXN0ZWQgYnkgUm9i
ZXJ0byBTYXNzdS4KCnY5OgogICogUmV3cml0ZSBJUEUgcGFyc2VyIHRvIHVzZSBrZXJuZWwgbWF0
Y2hfdGFibGUgcGFyc2VyLgogICogQWRhcHQgZXhpc3RpbmcgSVBFIHByb3BlcnRpZXMgdG8gdGhl
IG5ldyBwYXJzZXIuCiAgKiBSZW1vdmUgaXBlX2NvbnRleHQsIHF1b3RlIHBvbGljeSBzeW50YXgs
IGtlcm5lbF9yZWFkIGZvciBzaW1wbGljaXR5LgogICogQWRkIG5ldyBmdW5jdGlvbiBpbiB0aGUg
c2VjdXJpdHkgZmlsZSBzeXN0ZW0gdG8gZGVsZXRlIElQRSBwb2xpY3kuCiAgKiBNYWtlIElQRSBh
dWRpdCBidWlsdGluIGFuZCBjaGFuZ2Ugc2V2ZXJhbCBhdWRpdCBmb3JtYXRzLgogICogTWFrZSBi
b290X3ZlcmlmaWVkIHByb3BlcnR5IGJ1aWx0aW4KCkRldmVuIEJvd2VycyAoMTMpOgogIHNlY3Vy
aXR5OiBhZGQgaXBlIGxzbQogIGlwZTogYWRkIHBvbGljeSBwYXJzZXIKICBpcGU6IGFkZCBldmFs
dWF0aW9uIGxvb3AgYW5kIGludHJvZHVjZSAnYm9vdF92ZXJpZmllZCcgYXMgYSB0cnVzdAogICAg
cHJvdmlkZXIKICBpcGU6IGFkZCB1c2Vyc3BhY2UgaW50ZXJmYWNlCiAgaXBlOiBhZGQgTFNNIGhv
b2tzIG9uIGV4ZWN1dGlvbiBhbmQga2VybmVsIHJlYWQKICB1YXBpfGF1ZGl0fGlwZTogYWRkIGlw
ZSBhdWRpdGluZyBzdXBwb3J0CiAgaXBlOiBhZGQgcGVybWlzc2l2ZSB0b2dnbGUKICBibG9ja3xz
ZWN1cml0eTogYWRkIExTTSBibG9iIHRvIGJsb2NrX2RldmljZQogIGRtLXZlcml0eTogY29uc3Vt
ZSByb290IGhhc2ggZGlnZXN0IGFuZCBzaWduYXR1cmUgZGF0YSB2aWEgTFNNIGhvb2sKICBpcGU6
IGFkZCBzdXBwb3J0IGZvciBkbS12ZXJpdHkgYXMgYSB0cnVzdCBwcm92aWRlcgogIHNjcmlwdHM6
IGFkZCBib290IHBvbGljeSBnZW5lcmF0aW9uIHByb2dyYW0KICBpcGU6IGt1bml0IHRlc3QgZm9y
IHBhcnNlcgogIGRvY3VtZW50YXRpb246IGFkZCBpcGUgZG9jdW1lbnRhdGlvbgoKRmFuIFd1ICgz
KToKICBzZWN1cml0eTogYWRkIG5ldyBzZWN1cml0eWZzIGRlbGV0ZSBmdW5jdGlvbgogIGZzdmVy
aXR5OiBjb25zdW1lIGJ1aWx0aW4gc2lnbmF0dXJlIHZpYSBMU00gaG9vawogIGlwZTogZW5hYmxl
IHN1cHBvcnQgZm9yIGZzLXZlcml0eSBhcyBhIHRydXN0IHByb3ZpZGVyCgogRG9jdW1lbnRhdGlv
bi9hZG1pbi1ndWlkZS9MU00vaW5kZXgucnN0ICAgICAgIHwgICAxICsKIERvY3VtZW50YXRpb24v
YWRtaW4tZ3VpZGUvTFNNL2lwZS5yc3QgICAgICAgICB8IDcyOSArKysrKysrKysrKysrKysrKysK
IC4uLi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgICAgICAgICB8ICAxMiArCiBE
b2N1bWVudGF0aW9uL3NlY3VyaXR5L2luZGV4LnJzdCAgICAgICAgICAgICAgfCAgIDEgKwogRG9j
dW1lbnRhdGlvbi9zZWN1cml0eS9pcGUucnN0ICAgICAgICAgICAgICAgIHwgNDM2ICsrKysrKysr
KysrCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDgg
KwogYmxvY2svYmRldi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICsK
IGRyaXZlcnMvbWQvZG0tdmVyaXR5LXRhcmdldC5jICAgICAgICAgICAgICAgICB8ICAyNSArLQog
ZHJpdmVycy9tZC9kbS12ZXJpdHktdmVyaWZ5LXNpZy5jICAgICAgICAgICAgIHwgIDE2ICstCiBk
cml2ZXJzL21kL2RtLXZlcml0eS12ZXJpZnktc2lnLmggICAgICAgICAgICAgfCAgMTAgKy0KIGZz
L3Zlcml0eS9mc3Zlcml0eV9wcml2YXRlLmggICAgICAgICAgICAgICAgICB8ICAgMiArLQogZnMv
dmVyaXR5L29wZW4uYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEzICstCiBmcy92
ZXJpdHkvc2lnbmF0dXJlLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogaW5jbHVk
ZS9saW51eC9ibGtfdHlwZXMuaCAgICAgICAgICAgICAgICAgICAgIHwgICAzICsKIGluY2x1ZGUv
bGludXgvZG0tdmVyaXR5LmggICAgICAgICAgICAgICAgICAgICB8ICAxOSArCiBpbmNsdWRlL2xp
bnV4L2ZzdmVyaXR5LmggICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwogaW5jbHVkZS9saW51
eC9sc21faG9va19kZWZzLmggICAgICAgICAgICAgICAgIHwgICA1ICsKIGluY2x1ZGUvbGludXgv
bHNtX2hvb2tzLmggICAgICAgICAgICAgICAgICAgICB8ICAxMiArCiBpbmNsdWRlL2xpbnV4L3Nl
Y3VyaXR5LmggICAgICAgICAgICAgICAgICAgICAgfCAgMjMgKwogaW5jbHVkZS91YXBpL2xpbnV4
L2F1ZGl0LmggICAgICAgICAgICAgICAgICAgIHwgICAxICsKIHNjcmlwdHMvTWFrZWZpbGUgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBzY3JpcHRzL2lwZS9NYWtlZmlsZSAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwogc2NyaXB0cy9pcGUvcG9sZ2VuLy5naXRp
Z25vcmUgICAgICAgICAgICAgICAgIHwgICAxICsKIHNjcmlwdHMvaXBlL3BvbGdlbi9NYWtlZmls
ZSAgICAgICAgICAgICAgICAgICB8ICAgNiArCiBzY3JpcHRzL2lwZS9wb2xnZW4vcG9sZ2VuLmMg
ICAgICAgICAgICAgICAgICAgfCAxNDUgKysrKwogc2VjdXJpdHkvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDExICstCiBzZWN1cml0eS9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDEgKwogc2VjdXJpdHkvaW5vZGUuYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDI1ICsKIHNlY3VyaXR5L2lwZS8uZ2l0aWdub3JlICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgMSArCiBzZWN1cml0eS9pcGUvS2NvbmZpZyAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgNzUgKysKIHNlY3VyaXR5L2lwZS9NYWtlZmlsZSAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAzMiArCiBzZWN1cml0eS9pcGUvYXVkaXQuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAyNzkgKysrKysrKwogc2VjdXJpdHkvaXBlL2F1ZGl0LmggICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDE5ICsKIHNlY3VyaXR5L2lwZS9kaWdlc3QuYyAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDE0NCArKysrCiBzZWN1cml0eS9pcGUvZGlnZXN0LmggICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMjYgKwogc2VjdXJpdHkvaXBlL2V2YWwuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgNDI0ICsrKysrKysrKysKIHNlY3VyaXR5L2lwZS9ldmFsLmggICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICA2MCArKwogc2VjdXJpdHkvaXBlL2ZzLmMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgMjQyICsrKysrKwogc2VjdXJpdHkvaXBlL2ZzLmggICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDE3ICsKIHNlY3VyaXR5L2lwZS9ob29rcy5jICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDI3NSArKysrKysrCiBzZWN1cml0eS9pcGUvaG9va3MuaCAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgNDIgKwogc2VjdXJpdHkvaXBlL2lwZS5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDk3ICsrKwogc2VjdXJpdHkvaXBlL2lwZS5oICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDIyICsKIHNlY3VyaXR5L2lwZS9wb2xpY3kuYyAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDI1OSArKysrKysrCiBzZWN1cml0eS9pcGUvcG9saWN5LmggICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgOTMgKysrCiBzZWN1cml0eS9pcGUvcG9saWN5X2ZzLmMg
ICAgICAgICAgICAgICAgICAgICAgfCA0NTkgKysrKysrKysrKysKIHNlY3VyaXR5L2lwZS9wb2xp
Y3lfcGFyc2VyLmMgICAgICAgICAgICAgICAgICB8IDU0NSArKysrKysrKysrKysrCiBzZWN1cml0
eS9pcGUvcG9saWN5X3BhcnNlci5oICAgICAgICAgICAgICAgICAgfCAgMTEgKwogc2VjdXJpdHkv
aXBlL3BvbGljeV90ZXN0cy5jICAgICAgICAgICAgICAgICAgIHwgMjk0ICsrKysrKysKIHNlY3Vy
aXR5L3NlY3VyaXR5LmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA3MCArKwogNTAgZmls
ZXMgY2hhbmdlZCwgNDk4OCBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL0xTTS9pcGUucnN0CiBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9zZWN1cml0eS9pcGUucnN0CiBjcmVhdGUgbW9kZSAx
MDA2NDQgaW5jbHVkZS9saW51eC9kbS12ZXJpdHkuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHNjcmlw
dHMvaXBlL01ha2VmaWxlCiBjcmVhdGUgbW9kZSAxMDA2NDQgc2NyaXB0cy9pcGUvcG9sZ2VuLy5n
aXRpZ25vcmUKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzY3JpcHRzL2lwZS9wb2xnZW4vTWFrZWZpbGUK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBzY3JpcHRzL2lwZS9wb2xnZW4vcG9sZ2VuLmMKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBzZWN1cml0eS9pcGUvLmdpdGlnbm9yZQogY3JlYXRlIG1vZGUgMTAwNjQ0IHNl
Y3VyaXR5L2lwZS9LY29uZmlnCiBjcmVhdGUgbW9kZSAxMDA2NDQgc2VjdXJpdHkvaXBlL01ha2Vm
aWxlCiBjcmVhdGUgbW9kZSAxMDA2NDQgc2VjdXJpdHkvaXBlL2F1ZGl0LmMKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBzZWN1cml0eS9pcGUvYXVkaXQuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHNlY3VyaXR5
L2lwZS9kaWdlc3QuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHNlY3VyaXR5L2lwZS9kaWdlc3QuaAog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHNlY3VyaXR5L2lwZS9ldmFsLmMKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBzZWN1cml0eS9pcGUvZXZhbC5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgc2VjdXJpdHkvaXBlL2Zz
LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzZWN1cml0eS9pcGUvZnMuaAogY3JlYXRlIG1vZGUgMTAw
NjQ0IHNlY3VyaXR5L2lwZS9ob29rcy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgc2VjdXJpdHkvaXBl
L2hvb2tzLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzZWN1cml0eS9pcGUvaXBlLmMKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBzZWN1cml0eS9pcGUvaXBlLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzZWN1cml0
eS9pcGUvcG9saWN5LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzZWN1cml0eS9pcGUvcG9saWN5LmgK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBzZWN1cml0eS9pcGUvcG9saWN5X2ZzLmMKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBzZWN1cml0eS9pcGUvcG9saWN5X3BhcnNlci5jCiBjcmVhdGUgbW9kZSAxMDA2NDQg
c2VjdXJpdHkvaXBlL3BvbGljeV9wYXJzZXIuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHNlY3VyaXR5
L2lwZS9wb2xpY3lfdGVzdHMuYwoKLS0gCjIuMzkuMAoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0
CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9s
aXN0aW5mby9kbS1kZXZlbAo=

