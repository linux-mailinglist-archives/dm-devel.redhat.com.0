Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7E6190CCE
	for <lists+dm-devel@lfdr.de>; Tue, 24 Mar 2020 12:55:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585050941;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MXg+ZS4tOXd34CuNa1BO5XreJi4OJnwwNaf8KlpzecI=;
	b=Abs/6wpHicvbbzFlB1FSpwe5q1P9ykqp5Z2KDe+O4GoU/mybha3m+vuw6ktD4Bq7iiW0Ft
	T7lUwTEB7BYg9611CyuBVcX6oIvgl14uXyzv6alyKPBvo80Xv/2i5auXKrbKEeRovuaJN6
	ErVAiI72Fj3l5Sb0y2+3ZOrzINKQXMU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-EFsylQQIPOqgwDpcdTVrlA-1; Tue, 24 Mar 2020 07:55:39 -0400
X-MC-Unique: EFsylQQIPOqgwDpcdTVrlA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBB65DBA6;
	Tue, 24 Mar 2020 11:55:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5DCB60C05;
	Tue, 24 Mar 2020 11:55:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E26EA86380;
	Tue, 24 Mar 2020 11:55:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02OBr9gl015087 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Mar 2020 07:53:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 73FFCA3171; Tue, 24 Mar 2020 11:53:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7020CB17C8
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 11:53:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D46C78F782E
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 11:53:06 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-329-KO3bCgjUMUKMhfPLYFXcaw-1;
	Tue, 24 Mar 2020 07:53:04 -0400
X-MC-Unique: KO3bCgjUMUKMhfPLYFXcaw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id CEC64AD5D;
	Tue, 24 Mar 2020 11:53:02 +0000 (UTC)
To: Bob Liu <bob.liu@oracle.com>, dm-devel@redhat.com
References: <20200324110255.8385-1-bob.liu@oracle.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <e2bef18e-f363-47c4-dd38-971a60ec1eca@suse.de>
Date: Tue, 24 Mar 2020 12:52:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200324110255.8385-1-bob.liu@oracle.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02OBr9gl015087
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, Dmitry.Fomichev@wdc.com, Damien.LeMoal@wdc.com
Subject: Re: [dm-devel] [RFC PATCH v2 0/3] dm zoned: extend the way of
 exposing zoned block device
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gMy8yNC8yMCAxMjowMiBQTSwgQm9iIExpdSB3cm90ZToKPiBNb3RpdmF0aW9uOgo+IGRtLXpv
bmVkIGV4cG9zZXMgYSB6b25lZCBibG9jayBkZXZpY2UoWkJDKSBhcyBhIHJlZ3VsYXIgYmxvY2sg
ZGV2aWNlIGJ5IHN0b3JpbmcKPiBtZXRhZGF0YSBhbmQgYnVmZmVyaW5nIHJhbmRvbSB3cml0ZXMg
aW4gaXRzIGNvbnZlbnRpb25hbCB6b25lcy4KPiBUaGlzIHdheSBpcyBub3QgZmxleGlibGUsIHRo
ZXJlIG11c3QgYmUgZW5vdWdoIGNvbnZlbnRpb25hbCB6b25lcyBhbmQgdGhlCj4gcGVyZm9ybWFu
Y2UgbWF5IGJlIGNvbnN0cmFpbmVkLgo+IAo+IFRoaXMgcGF0Y2hzZXQgc3BsaXQgdGhlIG1ldGFk
YXRhIGZyb20gem9uZWQgZGV2aWNlIHRvIGFuIGV4dHJhIHJlZ3VsYXIgZGV2aWNlLAo+IHdpdGgg
YWltIHRvIGluY3JlYXNlIHRoZSBmbGV4aWJpbGl0eSBhbmQgcG90ZW50aWFsIHBlcmZvcm1hbmNl
Lgo+IEZvciBleGFtcGxlLCBub3cgd2UgY2FuIHN0b3JlIG1ldGFkYXRhIGluIGEgZmFzdGVyIGRl
dmljZSBsaWtlIHBlcnNpc3RlbnQgbWVtb3J5Lgo+IEFsc28gcmFuZG9tIHdyaXRlcyBjYW4gZ28g
dG8gdGhlIHJlZ3VsYXIgZGV2aWNlcyBpbiB0aGlzIHZlcnNpb24uCj4gCj4gVXNhZ2Uod2lsbCBz
ZW5kIHVzZXIgc3BhY2UgcGF0Y2hlcyBsYXRlcik6Cj4+IGRtemFkbSAtLWZvcm1hdCAkem9uZWRf
ZGV2IC0tcmVndWxhcj0kcmVndV9kZXYgLS1mb3JjZQo+PiBlY2hvICIwICRzaXplIHpvbmVkICRy
ZWd1X2RldiAkem9uZWRfZGV2IiB8IGRtc2V0dXAgY3JlYXRlICRkbS16b25lZC1uYW1lCj4gCj4g
djI6Cj4gICAqIGVtdWxhdGUgcmVndWxhciBkZXZpY2Ugem9uZSBpbmZvCj4gICAqIHN1cHBvcnQg
d3JpdGUgYm90aCBtZXRhZGF0YSBhbmQgcmFuZG9tIHdyaXRlcyB0byByZWd1bGFyIGRldgo+IAo+
IEJvYiBMaXUgKDMpOgo+ICAgIGRtIHpvbmVkOiByZW5hbWUgZGV2IG5hbWUgdG8gem9uZWRfZGV2
Cj4gICAgZG0gem9uZWQ6IGludHJvZHVjZSByZWd1bGFyIGRldmljZSB0byBkbS16b25lZC10YXJn
ZXQKPiAgICBkbSB6b25lZDogYWRkIHJlZ3VsYXIgZGV2aWNlIGluZm8gdG8gbWV0YWRhdGEKPiAK
PiAgIGRyaXZlcnMvbWQvZG0tem9uZWQtbWV0YWRhdGEuYyB8IDIwNSArKysrKysrKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLQo+ICAgZHJpdmVycy9tZC9kbS16b25lZC10YXJnZXQu
YyAgIHwgMjA1ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4gICBk
cml2ZXJzL21kL2RtLXpvbmVkLmggICAgICAgICAgfCAgNTMgKysrKysrKysrKy0KPiAgIDMgZmls
ZXMgY2hhbmdlZCwgMjk5IGluc2VydGlvbnMoKyksIDE2NCBkZWxldGlvbnMoLSkKPiAKV2VsbCwg
c3VycHJpc2UsIHN1cnByaXNlLCBib3RoIG91ciBwYXRjaHNldHMgYXJlIGxhcmdlbHkgaWRlbnRp
Y2FsIC4uLgoKU28gaG93IHRvIHByb2NlZWQ/IEkgZ3Vlc3MgaWYgeW91IHdlcmUgdXNpbmcgJ2Nk
ZXYnIGluc3RlYWQgb2YgCidyZWd1X2RtX2Rldicgd2Ugc2hvdWxkIGJlIGhhdmluZyBhbiBvdmVy
bGFwIG9mIGFib3V0IDkwIHBlcmNlbnQuCgpUaGUgbWFpbiBkaWZmZXJlbmNlIGJldHdlZW4gb3Vy
IGltcGxlbWVudGF0aW9uIGlzIHRoYXQgSSBkaWRuJ3QgbW92ZSB0aGUgCm1ldGFkYXRhIHRvIHRo
ZSBjYWNoZS9yZWd1bGFyZCBkZXZpY2UsIHNlZWluZyB0aGF0IGRtemFkbSB3aWxsIG9ubHkgCndy
aXRlIG1ldGFkYXRhIG9udG8gdGhlIHpvbmVkIGRldmljZS4KSSB3b3VsZCByYXRoZXIga2VlcCBp
dCB0aGF0IHdheSAoaWUgc3RvcmluZyBtZXRhZGF0YSBvbiB0aGUgem9uZWQgCmRldmljZSwgdG9v
LCBpZiBwb3NzaWJsZSkgYXMgd2Ugd291bGQgYmUga2VlcGluZyBiYWNrd2FyZHMgY29tcGFiaWxp
dHkgCndpdGggdGhhdC4KQW5kIHdlIGNvdWxkIGFsd2F5cyBtb3ZlIG1ldGFkYXRhIHRvIHRoZSBj
YWNoZS9yZWd1bGFyIGRldmljZSBpbiBhIGxhdGVyIApwYXRjaDsgZm9yIGRvaW5nIGl0IHByb3Bl
cmx5IHdlJ2xsIG5lZWQgdG8gdXBkYXRlIHRoZSBtZXRhZGF0YSBhbnl3YXkgYXMgCndlIG5lZWQg
dG8gaW50cm9kdWNlIFVVSURzIHRvIHN0aXRjaCB0aG9zZSBkZXZpY2VzIHRvZ2V0aGVyLgpSZW1l
bWJlciwgb25lIG15IGhhdmUgbW9yZSB0aGFuIG9uZSB6b25lZCBkZXZpY2UgYW5kIHJlZ3VsYXIg
ZGV2aWNlLi4uCgpTaG91bGQgSSB0cnkgdG8gbWVyZ2UgYm90aCBwYXRjaHNldHMgYW5kIHNlbmQg
dGhlbSBvdXQgYXMgYW4gUkZDPwoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5l
Y2tlICAgICAgICAgICAgVGVhbWxlYWQgU3RvcmFnZSAmIE5ldHdvcmtpbmcKaGFyZUBzdXNlLmRl
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIg
MzY4MDkgKEFHIE7DvHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZm
ZXIKCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczov
L3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

