Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7131354DF
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jan 2020 09:56:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578560170;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bhYSXj+F8JFiFtjFklTZCpDNwSrwk0qNe/Lrx7jHXtk=;
	b=cGAmbaa+vkTlcQxS9nA1ECMg0bbzvWeeDR6a/JkC+QXTlfkIj/A5+u/GZwfof4NnTh2abk
	Ad+Rm43ihqFiDyhYSd9eRKffTCnie/Ce77viz4AnqSZ6nYxAn19xx7ZIbC5GN+xRh3RpFm
	KuookUellHWASgpch/TOrW3CSDQbG6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-LLh4SeSPM5WmIKYh1-M8CQ-1; Thu, 09 Jan 2020 03:56:07 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48D8F1083E81;
	Thu,  9 Jan 2020 08:56:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AD855C28F;
	Thu,  9 Jan 2020 08:55:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 03D7C503BA;
	Thu,  9 Jan 2020 08:55:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 008AI7KE016326 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jan 2020 05:18:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 47FEE1004C76; Wed,  8 Jan 2020 10:18:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4136B1005E2D
	for <dm-devel@redhat.com>; Wed,  8 Jan 2020 10:18:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBADA8ED1E6
	for <dm-devel@redhat.com>; Wed,  8 Jan 2020 10:18:04 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-151-ME4hoBODN-m8_AOvJ_Bl4Q-1; Wed, 08 Jan 2020 05:18:02 -0500
Received: by mail-lj1-f196.google.com with SMTP id y6so2779488lji.0
	for <dm-devel@redhat.com>; Wed, 08 Jan 2020 02:18:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=xKXl8mES0mj219S7GiqAgh2w0+y6gtLh3SMd5LwoB2w=;
	b=neoqPtbfKOnP+CMmUkkXeozP9o6n5HnQ2nRwZs7SdwtsACJcECek6KLRfPKhIf+mrn
	PuPl3Hpcokr1zIvShFh3x23vmApxTj2nOa7bQiVI3bCGaJb7HcLgE3PEPiGR9e12SIaI
	Zx4Nxuh3OpaAG8HEw8uQuohOwNMJl7pB8FCHb3mV3NnGuHAKBYb0qyNX8dhwK7s6RP1H
	HU6BzHER/p904RjUiiTOoKOhabNDaCOiyyvRv+/k5zYCPtJ/Hx8VwsJatU5EPr0uA9nY
	UY2IPBDwmy1RgMkeEM41XuNhLqBhU9xl7lEr/DfrXSNADYKLHxSfVYkEEDRTfMbGv/y9
	EPIw==
X-Gm-Message-State: APjAAAWfowYsMJF5ZAVgbTsv3nxiqgF/Wc3VqJJd9cGwkro/twzjEU6K
	JnOGqZM6Eqy18wgxMdCSZhwMmQ==
X-Google-Smtp-Source: APXvYqxkrQcJp1PRSIjXq1IfBZjXHOW7grwryb0mwHMQOGl3j6AuqxM80gYItsKZXFTgXF0ueCxUyw==
X-Received: by 2002:a2e:9e4c:: with SMTP id g12mr2396280ljk.15.1578478681198; 
	Wed, 08 Jan 2020 02:18:01 -0800 (PST)
Received: from localhost ([194.62.217.57]) by smtp.gmail.com with ESMTPSA id
	q13sm1157778ljj.63.2020.01.08.02.18.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 02:18:00 -0800 (PST)
Date: Wed, 8 Jan 2020 11:17:59 +0100
From: Javier =?utf-8?B?R29uesOhbGV6?= <javier@javigon.com>
To: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
Message-ID: <20200108101759.32gkjxakxigolail@mpHalley.local>
References: <BYAPR04MB5749820C322B40C7DBBBCA02863F0@BYAPR04MB5749.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BYAPR04MB5749820C322B40C7DBBBCA02863F0@BYAPR04MB5749.namprd04.prod.outlook.com>
X-MC-Unique: ME4hoBODN-m8_AOvJ_Bl4Q-1
X-MC-Unique: LLh4SeSPM5WmIKYh1-M8CQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 008AI7KE016326
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 09 Jan 2020 03:55:26 -0500
Cc: "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Stephen Bates <sbates@raithlin.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Christoph Hellwig <hch@lst.de>,
	"msnitzer@redhat.com" <msnitzer@redhat.com>,
	"bvanassche@acm.org" <bvanassche@acm.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"roland@purestorage.com" <roland@purestorage.com>,
	"frederick.knight@netapp.com" <frederick.knight@netapp.com>,
	"zach.brown@ni.com" <zach.brown@ni.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"mpatocka@redhat.com" <mpatocka@redhat.com>,
	Keith Busch <kbusch@kernel.org>, Matias Bjorling <Matias.Bjorling@wdc.com>,
	"axboe@kernel.dk" <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	"rwheeler@redhat.com" <rwheeler@redhat.com>,
	"lsf-pc@lists.linux-foundation.org" <lsf-pc@lists.linux-foundation.org>,
	Logan Gunthorpe <logang@deltatee.com>,
	"stephen@eideticom.com" <stephen@eideticom.com>
Subject: Re: [dm-devel] [LSF/MM/BFP ATTEND] [LSF/MM/BFP TOPIC] Storage: Copy
	Offload
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gMDcuMDEuMjAyMCAxODoxNCwgQ2hhaXRhbnlhIEt1bGthcm5pIHdyb3RlOgo+SGkgYWxsLAo+
Cj4qIEJhY2tncm91bmQgOi0KPi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4KPkNvcHkgb2ZmbG9hZCBpcyBhIGZl
YXR1cmUgdGhhdCBhbGxvd3MgZmlsZS1zeXN0ZW1zIG9yIHN0b3JhZ2UgZGV2aWNlcwo+dG8gYmUg
aW5zdHJ1Y3RlZCB0byBjb3B5IGZpbGVzL2xvZ2ljYWwgYmxvY2tzIHdpdGhvdXQgcmVxdWlyaW5n
Cj5pbnZvbHZlbWVudCBvZiB0aGUgbG9jYWwgQ1BVLgo+Cj5XaXRoIHJlZmVyZW5jZSB0byB0aGUg
UklTQy1WIHN1bW1pdCBrZXlub3RlIFsxXSBzaW5nbGUgdGhyZWFkZWQKPnBlcmZvcm1hbmNlIGlz
IGxpbWl0aW5nIGR1ZSB0byBEZW5hcmQgc2NhbGluZyBhbmQgbXVsdGktdGhyZWFkZWQKPnBlcmZv
cm1hbmNlIGlzIHNsb3dpbmcgZG93biBkdWUgTW9vcmUncyBsYXcgbGltaXRhdGlvbnMuIFdpdGgg
dGhlIHJpc2UKPm9mIFNOSUEgQ29tcHV0YXRpb24gVGVjaG5pY2FsIFN0b3JhZ2UgV29ya2luZyBH
cm91cCAoVFdHKSBbMl0sCj5vZmZsb2FkaW5nIGNvbXB1dGF0aW9ucyB0byB0aGUgZGV2aWNlIG9y
IG92ZXIgdGhlIGZhYnJpY3MgaXMgYmVjb21pbmcKPnBvcHVsYXIgYXMgdGhlcmUgYXJlIHNldmVy
YWwgc29sdXRpb25zIGF2YWlsYWJsZSBbMl0uIE9uZSBvZiB0aGUgY29tbW9uCj5vcGVyYXRpb24g
d2hpY2ggaXMgcG9wdWxhciBpbiB0aGUga2VybmVsIGFuZCBpcyBub3QgbWVyZ2VkIHlldCBpcyBD
b3B5Cj5vZmZsb2FkIG92ZXIgdGhlIGZhYnJpY3Mgb3Igb24gdG8gdGhlIGRldmljZS4KPgo+KiBQ
cm9ibGVtIDotCj4tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Cj5UaGUgb3JpZ2luYWwgd29yayB3aGljaCBpcyBk
b25lIGJ5IE1hcnRpbiBpcyBwcmVzZW50IGhlcmUgWzNdLiBUaGUKPmxhdGVzdCB3b3JrIHdoaWNo
IGlzIHBvc3RlZCBieSBNaWt1bGFzIFs0XSBpcyBub3QgbWVyZ2VkIHlldC4gVGhlc2UgdHdvCj5h
cHByb2FjaGVzIGFyZSB0b3RhbGx5IGRpZmZlcmVudCBmcm9tIGVhY2ggb3RoZXIuIFNldmVyYWwg
c3RvcmFnZQo+dmVuZG9ycyBkaXNjb3VyYWdlIG1peGluZyBjb3B5IG9mZmxvYWQgcmVxdWVzdHMg
d2l0aCByZWd1bGFyIFJFQUQvV1JJVEUKPkkvTy4gQWxzbywgdGhlIGZhY3QgdGhhdCB0aGUgb3Bl
cmF0aW9uIGZhaWxzIGlmIGEgY29weSByZXF1ZXN0IGV2ZXIKPm5lZWRzIHRvIGJlIHNwbGl0IGFz
IGl0IHRyYXZlcnNlcyB0aGUgc3RhY2sgaXQgaGFzIHRoZSB1bmZvcnR1bmF0ZQo+c2lkZS1lZmZl
Y3Qgb2YgcHJldmVudGluZyBjb3B5IG9mZmxvYWQgZnJvbSB3b3JraW5nIGluIHByZXR0eSBtdWNo
Cj5ldmVyeSBjb21tb24gZGVwbG95bWVudCBjb25maWd1cmF0aW9uIG91dCB0aGVyZS4KPgo+KiBD
dXJyZW50IHN0YXRlIG9mIHRoZSB3b3JrIDotCj4tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Cj5XaXRoIFszXSBi
ZWluZyBoYXJkIHRvIGhhbmRsZSBhcmJpdHJhcnkgRE0vTUQgc3RhY2tpbmcgd2l0aG91dAo+c3Bs
aXR0aW5nIHRoZSBjb21tYW5kIGluIHR3bywgb25lIGZvciBjb3B5aW5nIElOIGFuZCBvbmUgZm9y
IGNvcHlpbmcKPk9VVC4gV2hpY2ggaXMgdGhlbiBkZW1vbnN0cmF0ZWQgYnkgdGhlIFs0XSB3aHkg
WzNdIGl0IGlzIG5vdCBhIHN1aXRhYmxlCj5jYW5kaWRhdGUuIEFsc28sIHdpdGggWzRdIHRoZXJl
IGlzIGFuIHVucmVzb2x2ZWQgcHJvYmxlbSB3aXRoIHRoZQo+dHdvLWNvbW1hbmQgYXBwcm9hY2gg
YWJvdXQgaG93IHRvIGhhbmRsZSBjaGFuZ2VzIHRvIHRoZSBETSBsYXlvdXQKPmJldHdlZW4gYW4g
SU4gYW5kIE9VVCBvcGVyYXRpb25zLgo+Cj4qIFdoeSBMaW51eCBLZXJuZWwgU3RvcmFnZSBTeXN0
ZW0gbmVlZHMgQ29weSBPZmZsb2FkIHN1cHBvcnQgbm93ID8KPi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4KPldp
dGggdGhlIHJpc2Ugb2YgdGhlIFNOSUEgQ29tcHV0YXRpb25hbCBTdG9yYWdlIFRXRyBhbmQgc29s
dXRpb25zIFsyXSwKPmV4aXN0aW5nIFNDU0kgWENvcHkgc3VwcG9ydCBpbiB0aGUgcHJvdG9jb2ws
IHJlY2VudCBhZHZhbmNlbWVudCBpbiB0aGUKPkxpbnV4IEtlcm5lbCBGaWxlIFN5c3RlbSBmb3Ig
Wm9uZWQgZGV2aWNlcyAoWm9uZWZzIFs1XSksIFBlZXIgdG8gUGVlcgo+RE1BIHN1cHBvcnQgaW4g
dGhlIExpbnV4IEtlcm5lbCBtYWlubHkgZm9yIE5WTWUgZGV2aWNlcyBbN10gYW5kCj5ldmVudHVh
bGx5IE5WTWUgRGV2aWNlcyBhbmQgc3Vic3lzdGVtIChOVk1lIFBDSWUvTlZNZU9GKSB3aWxsIGJl
bmVmaXQKPmZyb20gQ29weSBvZmZsb2FkIG9wZXJhdGlvbi4KPgo+V2l0aCB0aGlzIGJhY2tncm91
bmQgd2UgaGF2ZSBzaWduaWZpY2FudCBudW1iZXIgb2YgdXNlLWNhc2VzIHdoaWNoIGFyZQo+c3Ry
b25nIGNhbmRpZGF0ZXMgd2FpdGluZyBmb3Igb3V0c3RhbmRpbmcgTGludXggS2VybmVsIEJsb2Nr
IExheWVyIENvcHkKPk9mZmxvYWQgc3VwcG9ydCwgc28gdGhhdCBMaW51eCBLZXJuZWwgU3RvcmFn
ZSBzdWJzeXN0ZW0gY2FuIHRvIGFkZHJlc3MKPnByZXZpb3VzbHkgbWVudGlvbmVkIHByb2JsZW1z
IFsxXSBhbmQgYWxsb3cgZWZmaWNpZW50IG9mZmxvYWRpbmcgb2YgdGhlCj5kYXRhIHJlbGF0ZWQg
b3BlcmF0aW9ucy4gKFN1Y2ggYXMgbW92ZS9jb3B5IGV0Yy4pCj4KPkZvciByZWZlcmVuY2UgZm9s
bG93aW5nIGlzIHRoZSBsaXN0IG9mIHRoZSB1c2UtY2FzZXMvY2FuZGlkYXRlcyB3YWl0aW5nCj5m
b3IgQ29weSBPZmZsb2FkIHN1cHBvcnQgOi0KPgo+MS4gU0NTSS1hdHRhY2hlZCBzdG9yYWdlIGFy
cmF5cy4KPjIuIFN0YWNraW5nIGRyaXZlcnMgc3VwcG9ydGluZyBYQ29weSBETS9NRC4KPjMuIENv
bXB1dGF0aW9uYWwgU3RvcmFnZSBzb2x1dGlvbnMuCj43LiBGaWxlIHN5c3RlbXMgOi0gTG9jYWws
IE5GUyBhbmQgWm9uZWZzLgo+NC4gQmxvY2sgZGV2aWNlcyA6LSBEaXN0cmlidXRlZCwgbG9jYWws
IGFuZCBab25lZCBkZXZpY2VzLgo+NS4gUGVlciB0byBQZWVyIERNQSBzdXBwb3J0IHNvbHV0aW9u
cy4KPjYuIFBvdGVudGlhbGx5IE5WTWUgc3Vic3lzdGVtIGJvdGggTlZNZSBQQ0llIGFuZCBOVk1l
T0YuCj4KPiogV2hhdCB3ZSB3aWxsIGRpc2N1c3MgaW4gdGhlIHByb3Bvc2VkIHNlc3Npb24gPwo+
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPgo+SSdkIGxpa2UgdG8gcHJvcG9zZSBhIHNlc3Npb24gdG8gZ28gb3Zl
ciB0aGlzIHRvcGljIHRvIHVuZGVyc3RhbmQgOi0KPgo+MS4gV2hhdCBhcmUgdGhlIGJsb2NrZXJz
IGZvciBDb3B5IE9mZmxvYWQgaW1wbGVtZW50YXRpb24gPwo+Mi4gRGlzY3Vzc2lvbiBhYm91dCBo
YXZpbmcgYSBmaWxlIHN5c3RlbSBpbnRlcmZhY2UuCj4zLiBEaXNjdXNzaW9uIGFib3V0IGhhdmlu
ZyByaWdodCBzeXN0ZW0gY2FsbCBmb3IgdXNlci1zcGFjZS4KPjQuIFdoYXQgaXMgdGhlIHJpZ2h0
IHdheSB0byBtb3ZlIHRoaXMgd29yayBmb3J3YXJkID8KPjUuIEhvdyBjYW4gd2UgaGVscCB0byBj
b250cmlidXRlIGFuZCBtb3ZlIHRoaXMgd29yayBmb3J3YXJkID8KPgo+KiBSZXF1aXJlZCBQYXJ0
aWNpcGFudHMgOi0KPi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4KPkknZCBsaWtlIHRvIGludml0ZSBibG9jayBs
YXllciwgZGV2aWNlIGRyaXZlcnMgYW5kIGZpbGUgc3lzdGVtCj5kZXZlbG9wZXJzIHRvOi0KPgo+
MS4gU2hhcmUgdGhlaXIgb3BpbmlvbiBvbiB0aGUgdG9waWMuCj4yLiBTaGFyZSB0aGVpciBleHBl
cmllbmNlIGFuZCBhbnkgb3RoZXIgaXNzdWVzIHdpdGggWzRdLgo+My4gVW5jb3ZlciBhZGRpdGlv
bmFsIGRldGFpbHMgdGhhdCBhcmUgbWlzc2luZyBmcm9tIHRoaXMgcHJvcG9zYWwuCj4KPlJlcXVp
cmVkIGF0dGVuZGVlcyA6LQo+Cj5NYXJ0aW4gSy4gUGV0ZXJzZW4KPkplbnMgQXhib2UKPkNocmlz
dG9waCBIZWxsd2lnCj5CYXJ0IFZhbiBBc3NjaGUKPlN0ZXBoZW4gQmF0ZXMKPlphY2ggQnJvd24K
PlJvbGFuZCBEcmVpZXIKPlJpYyBXaGVlbGVyCj5Ucm9uZCBNeWtsZWJ1c3QKPk1pa2UgU25pdHpl
cgo+S2VpdGggQnVzY2gKPlNhZ2kgR3JpbWJlcmcKPkhhbm5lcyBSZWluZWNrZQo+RnJlZGVyaWNr
IEtuaWdodAo+TWlrdWxhcyBQYXRvY2thCj5NYXRpYXMgQmrDuHJsaW5nCj4KPlsxXWh0dHBzOi8v
Y29udGVudC5yaXNjdi5vcmcvd3AtY29udGVudC91cGxvYWRzLzIwMTgvMTIvQS1OZXctR29sZGVu
LUFnZS1mb3ItQ29tcHV0ZXItQXJjaGl0ZWN0dXJlLUhpc3RvcnktQ2hhbGxlbmdlcy1hbmQtT3Bw
b3J0dW5pdGllcy1EYXZpZC1QYXR0ZXJzb24tLnBkZgo+WzJdIGh0dHBzOi8vd3d3LnNuaWEub3Jn
L2NvbXB1dGF0aW9uYWwKPmh0dHBzOi8vd3d3Lm5hcGF0ZWNoLmNvbS9zdXBwb3J0L3Jlc291cmNl
cy9zb2x1dGlvbi1kZXNjcmlwdGlvbnMvbmFwYXRlY2gtc21hcnRuaWMtc29sdXRpb24tZm9yLWhh
cmR3YXJlLW9mZmxvYWQvCj4gICAgICBodHRwczovL3d3dy5laWRldGljb20uY29tL3Byb2R1Y3Rz
Lmh0bWwKPmh0dHBzOi8vd3d3LnhpbGlueC5jb20vYXBwbGljYXRpb25zL2RhdGEtY2VudGVyL2Nv
bXB1dGF0aW9uYWwtc3RvcmFnZS5odG1sCj5bM10gZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L21rcC9saW51eC5naXQgeGNvcHkKPls0XSBodHRwczovL3d3dy5z
cGluaWNzLm5ldC9saXN0cy9saW51eC1ibG9jay9tc2cwMDU5OS5odG1sCj5bNV0gaHR0cHM6Ly9s
d24ubmV0L0FydGljbGVzLzc5MzU4NS8KPls2XSBodHRwczovL252bWV4cHJlc3Mub3JnL25ldy1u
dm1ldG0tc3BlY2lmaWNhdGlvbi1kZWZpbmVzLXpvbmVkLQo+bmFtZXNwYWNlcy16bnMtYXMtZ28t
dG8taW5kdXN0cnktdGVjaG5vbG9neS8KPls3XSBodHRwczovL2dpdGh1Yi5jb20vc2JhdGVzMTMw
MjcyL2xpbnV4LXAycG1lbQo+WzhdIGh0dHBzOi8va2VybmVsLmRrL2lvX3VyaW5nLnBkZgo+Cj5S
ZWdhcmRzLAo+Q2hhaXRhbnlhCgpJIHRoaW5rIHRoaXMgaXMgZ29vZCB0b3BpYyBhbmQgSSB3b3Vs
ZCBsaWtlIHRvIHBhcnRpY2lwYXRlIGluIHRoZQpkaXNjdXNzaW9uIHRvby4gSSB0aGluayB0aGF0
IExvZ2FuIEd1bnRob3JwZSB3b3VsZCBhbHNvIGJlIGludGVyZXN0ZWQKKENjKS4gQWRkaW5nIEth
bmNoYW4gdG9vLCB3aG8gaXMgYWxzbyB3b3JraW5nIG9uIHRoaXMgYW5kIGNhbiBjb250cmlidXRl
CnRvIHRoZSBkaXNjdXNzaW9uCgpXZSBkaXNjdXNzZWQgdGhpcyBpbiB0aGUgY29udGV4dCBvZiBQ
MlAgYXQgZGlmZmVyZW50IFNOSUEgZXZlbnRzIGluIHRoZQpjb250ZXh0IG9mIGNvbXB1dGF0aW9u
YWwgb2ZmbG9hZHMgYW5kIGFsc28gYXMgdGhlIGJhY2tlbmQgaW1wbGVtZW50YXRpb24KZm9yIFNp
bXBsZSBDb3B5LCB3aGljaCBpcyBjb21pbmcgaW4gTlZNZS4gRGlzY3Vzc2luZyB0aGlzIChhZ2Fp
bikgYXQKTFNGL01NIGFuZCBmaW5kaW5nIGEgd2F5IHRvIGZpbmFsbHkgZ2V0IFhDT1BZIG1lcmdl
ZCB3b3VsZCBiZSBncmVhdC4KClRoYW5rcywKSmF2aWVyCgoKCgotLQpkbS1kZXZlbCBtYWlsaW5n
IGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4v
bGlzdGluZm8vZG0tZGV2ZWw=

